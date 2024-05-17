import 'package:flutter/material.dart';
import 'package:footcourt/main.dart';

class StartupPage extends StatefulWidget {
  @override
  _StartupPageState createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  void initState() {
    super.initState();
    // Perform any necessary initialization or checks here
    // For example, you can check if the user is logged in, fetch data, etc.
    // After the initialization is complete, navigate to the desired page
    navigateToHomePage();
  }

  void navigateToHomePage() {
    // Replace 'HomePage()' with the actual widget representing your home page
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
