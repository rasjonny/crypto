// ignore_for_file: prefer_const_constructors

import 'package:crypto/net/flutter_fire.dart';
import 'package:flutter/material.dart';

import 'home_view.dart';

class Authentication extends StatefulWidget {
  const Authentication({Key? key}) : super(key: key);

  @override
  _AuthenticationState createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: const BoxDecoration(
        color: Colors.cyan,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextFormField(
            controller: email,
            decoration: InputDecoration(
              hintText: 'something@gmail.com',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              labelText: 'email',
            ),
          ),
          TextFormField(
            controller: password,
            obscureText: true,
            decoration: InputDecoration(
              hintText: 'password',
              hintStyle: TextStyle(
                color: Colors.white,
              ),
              labelText: 'password',
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent),
            child: MaterialButton(
                child: Text('register'),
                onPressed: () async {
                  bool shouldNavigate = await signIn(email.text, password.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (HomeView()),
                      ),
                    );
                  }
                }),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent),
            child: MaterialButton(
                child: Text('register'),
                onPressed: () async {
                  bool shouldNavigate = await signIn(email.text, password.text);
                  if (shouldNavigate) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => (HomeView()),
                      ),
                    );
                  }
                }),
          ),
        ],
      ),
    ));
  }
}
