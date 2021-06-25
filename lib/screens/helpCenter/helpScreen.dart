import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluid/components/default_button.dart';
import 'package:fluid/components/rounded_icon_btn.dart';
import 'package:fluid/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class HelpScreen extends StatefulWidget {
  static const String routeName = '/help';

  @override
  _HelpScreenState createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Help Center'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            toolbarHeight: 0,
          ),
          _buildNotificationSettings(context),
        ],
      ),
    );
  }

  Widget _buildNotificationSettings(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Column(
          children: [
            const SizedBox(height: 24),
            const SizedBox(height: 32),
            _buildForm(),
            const SizedBox(height: 10),
          ],
        ),
      ]),
    );
  }

  _buildForm() {
    return Column(
      children: [
        Image(image: AssetImage('assets/images/support.png')),
        Center(
          child: Text(
            'Need Help ?',
            style: TextStyle(
              fontSize: 30,
              color: kPrimaryColor.withOpacity(0.5),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
        Divider(
          thickness: 2,
        ),
        Center(
          child: SizedBox(
            width: 300,
            child: Text(
              'We are here to help you, just select one of the following options to get in touch with our support team',
              style: TextStyle(
                fontSize: 15,
                color: kPrimaryColor.withOpacity(1),
              ),
            ),
          ),
        ),
        Divider(
          thickness: 2,
        ),
        SizedBox(
          height: 10,
        ),
        whatsappSupport
            ? InkWell(
                onTap: () async {
                  const url = whatsappSupportLink;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Image(
                      //image: NetworkImage(
                      //    'https://es.logodownload.org/wp-content/uploads/2018/10/whatsapp-logo-11.png')),
                      Text(
                        'Whatsapp',
                        style: TextStyle(color: Colors.green, fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(),
        instagramSupport
            ? InkWell(
                onTap: () async {
                  const url = instagramSupportLink;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_alarms_outlined,
                        color: Colors.pink,
                      ),
                      Text(
                        'Instagram',
                        style: TextStyle(color: Colors.pink, fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(),
        facebookSupport
            ? InkWell(
                onTap: () async {
                  const url = facebookSupportLink;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_alarms_outlined,
                        color: Colors.blue,
                      ),
                      Text(
                        'Facebook',
                        style: TextStyle(color: Colors.blue, fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(),
        telephoneSupport
            ? InkWell(
                onTap: () async {
                  const url = telephoneSupportLink;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_alarms_outlined,
                        color: kPrimaryColor,
                      ),
                      Text(
                        'Telephone',
                        style: TextStyle(color: kPrimaryColor, fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox(),
        twitterSupport
            ? InkWell(
                onTap: () async {
                  const url = twitterSupportLink;
                  if (await canLaunch(url)) {
                    await launch(url);
                  } else {
                    throw 'Could not launch $url';
                  }
                },
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.access_alarms_outlined,
                        color: Colors.lightBlue,
                      ),
                      Text(
                        'Twitter',
                        style: TextStyle(color: Colors.lightBlue, fontSize: 20),
                      )
                    ],
                  ),
                ),
              )
            : SizedBox()
      ],
    );
  }
}
