import 'package:flutter/material.dart';
import 'AboutUs.dart';
import 'log.dart';
import 'ChangeUname.dart';
import 'get_location.dart';

class StettingPage extends StatelessWidget {
  const StettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Safe Drive',
              style: TextStyle(
                fontSize: 40.0,
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontFamily: 'Pacifico',
              ),
            ),
            const Text(
              'ICT Wireless project',
              style: TextStyle(
                  fontSize: 30.0,
                  color: Colors.white,
                  letterSpacing: 2.5,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Source Sans Pro'),
            ),
            const SizedBox(
              height: 20,
              width: 200,
              child: Divider(
                color: Colors.white,
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              child: const Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.location_city,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "ICT Mahidol University",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const AboutUs()))
              },
              child: const Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.sentiment_satisfied_alt,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "About us",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => {logList.clear()},
              child: const Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.restore,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Clear History",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: () => {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ChangeUname()))
              },
              child: const Card(
                color: Colors.white,
                margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
                child: ListTile(
                  leading: Icon(
                    Icons.settings,
                    color: Colors.blue,
                  ),
                  title: Text(
                    "Change user name",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20.0,
                      fontFamily: 'Source Sans Pro',
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
