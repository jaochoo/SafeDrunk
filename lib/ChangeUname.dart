import 'package:flutter/material.dart';
import 'main.dart';

class ChangeUname extends StatefulWidget {
  const ChangeUname({super.key});
  State<ChangeUname> createState() => _ChangeUname();
}

class _ChangeUname extends State<ChangeUname> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text(user_name)),
        body: Form(
            key: _formKey,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 16),
                        child: TextFormField(
                          controller: usernameController,
                          decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: "User name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter location';
                            }
                            return null;
                          },
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 16.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                const SizedBox(height: 20),
                                ElevatedButton(
                                    onPressed: () {
                                      user_name = usernameController.text;
                                    },
                                    child: Text('Change user name'))
                              ])),
                    ]))));
  }
}
