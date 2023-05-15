import 'dart:convert';
import 'package:car/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class SubmitLocationPage extends StatelessWidget {
  const SubmitLocationPage({super.key, required this.location});
  final String location;

  Future sendEmail(String subject, String body, String recipientemail) async {
    final url = Uri.parse('https://api.emailjs.com/api/v1.0/email/send');
    const serviceID = 'service_s4p9tgc';
    const templateID = 'template_68a5mwj';
    const userID = 'TtofRZKyLtA-Os-nm';
    final response = await http.post(url,
        headers: {
          'origin': 'http://localhost',
          'Content-type': 'application/json'
        },
        body: json.encode({
          'service_id': serviceID,
          'template_id': templateID,
          'user_id': userID,
          'template_params': {
            'Subject': subject,
            'message': body,
            'user_email': recipientemail
          }
        }));
    print(response.body);
    return response.statusCode;
  }

  @override
  Widget build(BuildContext context) {
    String Esubject = "$user_name is too drunk to drive";
    String Ebody =
        "This is email form safe drive inform that $user_name is at $location please come and pick him up. He is too drunk to drive by himself";
    final _key = GlobalKey<FormState>();
    final TextEditingController emailController = TextEditingController();

    return Center(
        child: Scaffold(
            appBar: AppBar(title: const Text('')),
            body: Center(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(children: [
                  const Text(
                    "Sending the Email",
                    style: TextStyle(fontSize: 25),
                  ),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: TextFormField(
                        key: _key,
                        controller: emailController,
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: "Enter receiver email address"),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter email';
                          }
                          return null;
                        },
                      )),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(children: [
                            Text("Email subject:  "),
                            Text(
                              Esubject,
                              style: TextStyle(fontSize: 14),
                            ),
                          ]),
                        ],
                      )),
                  Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          Row(children: [Text("Email body:")]),
                          Text(
                            Ebody,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      )),
                  ElevatedButton(
                      onPressed: () {
                        sendEmail(Esubject, Ebody, emailController.text);
                        print("sending email");
                      },
                      child: Text('Send email'))
                ]),
              ),
            )));
  }
}
