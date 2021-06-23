import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluid/constants.dart';

class NotificationsScreen extends StatefulWidget {
  static const String routeName = '/notifications';

  @override
  _NotificationsScreenState createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            brightness: Brightness.light,
            backgroundColor: Colors.transparent,
            toolbarHeight: 0,
          ),
          _buildNotificationList(context),
        ],
      ),
    );
  }

  Widget _buildNotificationList(BuildContext context) {
    return SliverList(
      delegate: SliverChildListDelegate([
        Column(
          children: [
            const SizedBox(height: 24),
            Align(
              alignment: Alignment.topCenter,
              child: Icon(
                Icons.notifications_on_sharp,
                size: 60,
                color: kPrimaryColor,
              ),
            ),
            Text(
              'Notifications',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            NotificationItems(),
            const SizedBox(height: 10),
            ElevatedButton(
              //color: kPrimaryColor,
              style: ElevatedButton.styleFrom(
                primary: kPrimaryColor,
                elevation: 0,
                shape: const StadiumBorder(),
              ),
              key: Key('login-button-key'),
              child: Text(
                'Go back',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              // onTap: () {
              //   Navigator.pop(context);
              // },
              // text: 'goBack',
            ),
          ],
        ),
      ]),
    );
  }
}

class NotificationItems extends StatelessWidget {
  const NotificationItems({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
              child: Column(
            children: [
              _buildNotificationItemCard(),
              SizedBox(
                height: 20,
              ),
              _buildNotificationItemCard(),
            ],
          ))),
    );
  }

  Widget _buildNotificationItemCard() {
    return Card(
        margin: EdgeInsets.zero,
        elevation: 4,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    flex: 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'saleNotification',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(
                        width: 50,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: InkWell(
                              onTap: () {},
                              child: Icon(
                                Icons.highlight_remove_rounded,
                                color: kPrimaryColor,
                              )),
                        )),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15, left: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                      'descriptivetTextOfTheNotification, \ndescriptivetTextOfTheNotification',
                      style: TextStyle(
                          fontWeight: FontWeight.normal, fontSize: 16)),
                ],
              ),
            ),
          ],
        ));
  }
}
