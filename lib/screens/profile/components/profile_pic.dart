import 'dart:io';
import 'package:path/path.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:fluid/constants.dart';
import 'package:fluid/helper/image_util.dart';
import 'package:fluid/providers/authentication_provider.dart';
import 'package:http_parser/src/media_type.dart' show MediaType;
import 'package:fluid/models/user_response.dart';

class ProfilePic extends StatefulWidget {
  ProfilePic({Key key}) : super(key: key);

  @override
  _ProfilePicState createState() => _ProfilePicState();
}

class _ProfilePicState extends State<ProfilePic> {
  @override
  Widget build(BuildContext context) {
    final authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    bool _loggedIn = authenticationProvider.isUserLoggedIn;

    return Container(
      child: SizedBox(
        height: 115,
        width: 115,
        child: Stack(
          fit: StackFit.expand,
          overflow: Overflow.visible,
          children: [
            CircleAvatar(
              //backgroundImage: AssetImage("assets/images/Profile Image.png"),
              //backgroundImage: AssetImage(),
              child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: kPrimaryColor,
                      image: _loggedIn == null
                          ? DecorationImage(
                              image: NetworkImage(getUserPic(context)),
                              fit: BoxFit.fill)
                          : DecorationImage(
                              image: AssetImage(
                                  'assets/images/user-default.png')))),
            ),
            Positioned(
                right: -16,
                bottom: 0,
                child: _loggedIn
                    ? SizedBox(
                        height: 46,
                        width: 46,
                        child: FlatButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(50),
                            side: BorderSide(color: Colors.white),
                          ),
                          color: Color(0xFFF5F6F9),
                          onPressed: () {
                            _updateProfileImage(context);
                          },
                          child:
                              SvgPicture.asset("assets/icons/Camera Icon.svg"),
                        ),
                      )
                    : SizedBox())
          ],
        ),
      ),
    );
  }

  _updateProfileImage(BuildContext context) {
    final authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    ImageUtil.getImage(context, (image) async {
      if (image == null) return;
      final file = File(image.path);

      final fileNameWithExtension = basename(file.path);

      final formData = FormData.fromMap({
        'uploadedFile': MultipartFile.fromFileSync(image.path,
            filename: fileNameWithExtension,
            contentType: MediaType('image', 'jpeg'))
      });

      try {
        await authenticationProvider.updateUserProfileImage(
            formData, authenticationProvider.loggedUser);
        setState(() {
          authenticationProvider.loggedUser.profilePictureUrl = image.path;
        });
      } catch (error) {
        //await handleError(error);
      }
    });
  }

  String getUserPic(BuildContext context) {
    final authenticationProvider =
        Provider.of<AuthenticationProvider>(context, listen: false);
    try {
      UserResponse usuario = authenticationProvider.loggedUser;
      if (usuario != null) {
        if (usuario.profilePictureUrl == null ||
            usuario.profilePictureUrl == "" &&
                authenticationProvider.isUserLoggedIn) {
          return 'https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder.jpg';
        } else {
          return usuario.profilePictureUrl;
        }
      } else {
        return 'https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder.jpg';
      }
    } catch (error) {
      //await handleError(error);
      print(error);
      return 'https://www.bsn.eu/wp-content/uploads/2016/12/user-icon-image-placeholder.jpg';
    }
  }
}
