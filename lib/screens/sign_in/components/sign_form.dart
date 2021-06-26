import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fluid/components/custom_surfix_icon.dart';
import 'package:fluid/components/form_error.dart';
import 'package:fluid/helper/keyboard.dart';
import 'package:fluid/helper/loading_util.dart';
import 'package:fluid/models/client_user.dart';
import 'package:fluid/providers/authentication_provider.dart';
import 'package:fluid/screens/forgot_password/forgot_password_screen.dart';
import 'package:fluid/screens/login_success/login_success_screen.dart';
import '../../../components/default_button.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignForm extends StatefulWidget {
  @override
  _SignFormState createState() => _SignFormState();
}

class _SignFormState extends State<SignForm> {
  @override
  void initState() {
    super.initState();
    performAutologinWhenPossible();
  }

  ClientUser _user = new ClientUser();
  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  bool remember = false;
  final List<String> errors = [];

  void addError({String error}) {
    if (!errors.contains(error))
      setState(() {
        errors.add(error);
      });
  }

  void removeError({String error}) {
    if (errors.contains(error))
      setState(() {
        errors.remove(error);
      });
  }

  Future performAutologinWhenPossible() async {
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);

    bool userIsAlreadyLogged = await authProvider.hasUserAlreadyLoggedIn();
    await authProvider.getCurrentUser();
    if (userIsAlreadyLogged && authProvider.loggedUser != null) {
      authProvider.isUserLoggedIn = true;
      KeyboardUtil.hideKeyboard(context);
      Navigator.pushNamed(context, LoginSuccessScreen.routeName);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          Row(
            children: [
              Checkbox(
                value: remember,
                activeColor: kPrimaryColor,
                onChanged: (value) {
                  setState(() {
                    remember = value;
                  });
                },
              ),
              Text("Remember me"),
              Spacer(),
              GestureDetector(
                onTap: () => Navigator.pushNamed(
                    context, ForgotPasswordScreen.routeName),
                child: Text(
                  "Forgot Password",
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ],
          ),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(20)),
          DefaultButton(
            text: "Continue",
            icon: Icon(
              Icons.arrow_forward_ios_sharp,
              color: Colors.white,
            ),
            press: () {
              if (_formKey.currentState.validate()) {
                _formKey.currentState.save();
                _onFormSubmit();
              }
            },
          ),
        ],
      ),
    );
  }

  Future _onFormSubmit() async {
    try {
      final state = _formKey.currentState;
      final authProvider =
          Provider.of<AuthenticationProvider>(context, listen: false);
      if (state.validate()) {
        LoadingUtil.startLoading('Validating Credentials');
        state.save();
        _user.email = email;
        _user.password = password;
        await authProvider.authenticateUser(_user, remember);
        LoadingUtil.hideLoading();
        KeyboardUtil.hideKeyboard(context);
        await Navigator.of(context).pushNamedAndRemoveUntil(
            LoginSuccessScreen.routeName, (Route<dynamic> route) => false);
      }
    } catch (e) {
      CoolAlert.show(
        context: context,
        backgroundColor: kPrimaryColor,
        barrierDismissible: true,
        confirmBtnText: 'Try again',
        confirmBtnColor: kPrimaryColor,
        title: 'Ups, the login failed',
        type: CoolAlertType.info,
        text: "Information is not correct",
      );
      LoadingUtil.hideLoading();
      //await handleError(e);
      print(e);
    } finally {
      LoadingUtil.hideLoading();
    }
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
      obscureText: true,
      initialValue: 'RC8099036257rc',
      onSaved: (newValue) => password = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPassNullError);
        } else if (value.length >= 8) {
          removeError(error: kShortPassError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPassNullError);
          return "";
        } else if (value.length < 8) {
          addError(error: kShortPassError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Lock.svg"),
      ),
    );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      initialValue: 'ronel.cruz.a8@gmail.com',
      onSaved: (newValue) => email = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Email",
        hintText: "Enter your email",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Mail.svg"),
      ),
    );
  }
}
