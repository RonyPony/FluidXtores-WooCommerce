import 'package:flutter/material.dart';
import 'package:fluidxtores/constants.dart';
import 'package:flutter/services.dart';

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
            backgroundColor: Colors.transparent,
            toolbarHeight: 0, systemOverlayStyle: SystemUiOverlayStyle.dark,
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
                  .headline6!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 32),
            //NotificationItems(),
            ceroNotifications(),
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

  ceroNotifications() {
    return Column(
      children: [
        SizedBox(
          height: 50,
        ),
        Icon(
          Icons.notifications_off_outlined,
          color: kPrimaryColor.withOpacity(0.3),
          size: 80,
        ),
        Center(
          child: Text(
            'Vaya!',
            style: TextStyle(
              fontSize: 30,
              color: kPrimaryColor.withOpacity(0.5),
            ),
          ),
        ),
        Center(
          child: Text(
            'There are not notifications to show',
            style: TextStyle(
              color: kPrimaryColor.withOpacity(1),
            ),
          ),
        ),
        SizedBox(
          height: 50,
        ),
      ],
    );
  }
}

class NotificationItems extends StatelessWidget {
  const NotificationItems({
    Key? key,
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
