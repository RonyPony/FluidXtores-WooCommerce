import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluid/constants.dart';

class NotificationsSettingScreen extends StatefulWidget {
  static const String routeName = '/notificationsSetting';

  @override
  _NotificationsSettingScreenState createState() =>
      _NotificationsSettingScreenState();
}

class _NotificationsSettingScreenState
    extends State<NotificationsSettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications Settings'),
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
        SizedBox(
          height: 50,
        ),
        Icon(
          Icons.settings,
          color: kPrimaryColor.withOpacity(0.3),
          size: 80,
        ),
        Center(
          child: Text(
            'Hey!',
            style: TextStyle(
              fontSize: 30,
              color: kPrimaryColor.withOpacity(0.5),
            ),
          ),
        ),
        Center(
          child: Text(
            'These options are not available in your area.',
            style: TextStyle(
              color: kPrimaryColor.withOpacity(1),
            ),
          ),
        )
      ],
    );
  }
}
