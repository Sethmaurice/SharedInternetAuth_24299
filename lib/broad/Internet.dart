import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/broad/Second.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart'; // Import the connectivity package
import 'package:fluttertoast/fluttertoast.dart';

class Internet extends StatefulWidget {
  const Internet({Key? key}) : super(key: key);

  @override
  State<Internet> createState() => _InternetState();
}

class _InternetState extends State<Internet> {
  late StreamSubscription subscription;
  var isDeviceConnected = true; // Assume initially connected

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        isDeviceConnected = result != ConnectivityResult.none;
      });
      if (!isDeviceConnected) {
        showDialoglogBox();
      }
    });
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text('Connectivity Checker', style: TextStyle(color: Colors.amber)),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Second()),
              ),
              child: Text('Continue'),
            ),
            SizedBox(height: 20),
            Text(isDeviceConnected
                ? "Internet connected"
                : "No internet connection"),
          ],
        ),
      ),
    );
  }

  void showDialoglogBox() {
    Fluttertoast.showToast(
      msg: "No internet connection",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }
}
