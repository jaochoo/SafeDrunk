import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Scaffold(
            appBar: AppBar(title: const Text('')),
            body: Center(
                child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'About us',
                            style: const TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Text(
                          'We are ICT students who study the subject of Wireless. In this project, we have to use flutter to create an application that uses ether API or the device sensor. We choose to use Geolocator for this project',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ],
                    )))));
  }
}
