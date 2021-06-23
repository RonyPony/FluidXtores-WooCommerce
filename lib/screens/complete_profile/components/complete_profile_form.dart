import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:fluid/components/custom_surfix_icon.dart';
import 'package:fluid/components/default_button.dart';
import 'package:fluid/components/form_error.dart';
import 'package:fluid/contracts/authentication_service_contract.dart';
import 'package:fluid/helper/loading_util.dart';
import 'package:fluid/models/client_user.dart';
import 'package:fluid/providers/authentication_provider.dart';
import 'package:fluid/screens/sign_in/sign_in_screen.dart';
import 'package:fluid/services/authentication_service.dart';

import '../../../constants.dart';
import '../../../size_config.dart';

class CompleteProfileForm extends StatefulWidget {
  @override
  _CompleteProfileFormState createState() => _CompleteProfileFormState();
}

class _CompleteProfileFormState extends State<CompleteProfileForm> {
  AuthenticationServiceContract _authenticationService;
  ClientUser _user = ClientUser();
  final _formKey = GlobalKey<FormState>();
  final List<String> errors = [];
  String firstName;
  String lastName;
  String phoneNumber;
  String address;

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

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildFirstNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildLastNameFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildPhoneNumberFormField(),
          SizedBox(height: getProportionateScreenHeight(30)),
          buildAddressFormField(),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40)),
          DefaultButton(
            icon: Icon(
              Icons.person_add,
              color: Colors.white,
            ),
            text: "Register",
            press: () async {
              if (_formKey.currentState.validate()) {
                LoadingUtil.startLoading('Registering...');
                _authenticationService = AuthenticationService();
                ClientUser tmpUser = await _authenticationService.getTempUser();
                await _onFormSubmit(tmpUser);

                LoadingUtil.hideLoading();
                Navigator.of(context).pushNamedAndRemoveUntil(
                    SignInScreen.routeName, (route) => false);
                CoolAlert.show(
                  context: context,
                  backgroundColor: kPrimaryColor,
                  barrierDismissible: true,
                  confirmBtnText: 'Ok',
                  confirmBtnColor: kPrimaryColor,
                  title: 'Great!',
                  type: CoolAlertType.success,
                  text:
                      "Awesome, the procces is now complete. you are oficially part of the fam!",
                );
              }
            },
          ),
        ],
      ),
    );
  }

  Future _onFormSubmit(ClientUser usuario) async {
    final state = _formKey.currentState;
    final authProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    _user.email = usuario.email;
    _user.password = usuario.password;
    _user.confirmPassword = usuario.confirmPassword;

    try {
      if (state.validate()) {
        state.save();
        String customerId = await authProvider.register(_user);
      }
    } on PlatformException catch (e) {
      CoolAlert.show(
        context: context,
        backgroundColor: kPrimaryColor,
        barrierDismissible: true,
        confirmBtnText: 'Try again',
        confirmBtnColor: kPrimaryColor,
        title: 'Ups, the register failed',
        type: CoolAlertType.info,
        text: "${e.message}",
      );
    } catch (e) {
      final String errorMessage = e.toString();
      //showErrorDialog(errorMessage, context);
    }
  }

  TextFormField buildAddressFormField() {
    return TextFormField(
      onSaved: (newValue) => address = newValue,
      onTap: () async {
        Position currentLocation = await Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.best);
        _user.latitude = currentLocation.latitude;
        _user.longitude = currentLocation.longitude;
      },
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kAddressNullError);
          _user.address1 = value;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kAddressNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Address",
        hintText: "Enter your phone address",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon:
            CustomSurffixIcon(svgIcon: "assets/icons/Location point.svg"),
      ),
    );
  }

  TextFormField buildPhoneNumberFormField() {
    return TextFormField(
      keyboardType: TextInputType.phone,
      onSaved: (newValue) => phoneNumber = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kPhoneNumberNullError);
          _user.phoneNumber = value;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kPhoneNumberNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your phone number",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/Phone.svg"),
      ),
    );
  }

  TextFormField buildLastNameFormField() {
    return TextFormField(
      onSaved: (newValue) => lastName = newValue,
      onChanged: (value) {
        _user.lastName = value;
      },
      decoration: InputDecoration(
        labelText: "Last Name",
        hintText: "Enter your last name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }

  TextFormField buildFirstNameFormField() {
    return TextFormField(
      onSaved: (newValue) => firstName = newValue,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNamelNullError);
          _user.firstName = value;
        }
        return null;
      },
      validator: (value) {
        if (value.isEmpty) {
          addError(error: kNamelNullError);
          return "";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: "First Name",
        hintText: "Enter your first name",
        // If  you are using latest version of flutter then lable text and hint text shown like this
        // if you r using flutter less then 1.20.* then maybe this is not working properly
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: CustomSurffixIcon(svgIcon: "assets/icons/User.svg"),
      ),
    );
  }
}
