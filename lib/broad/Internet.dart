import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/broad/Second.dart';
import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class Internet extends StatefulWidget {
  const Internet({Key? key}) : super(key: key);

  @override
  State<Internet> createState() => _InternetState();
}

class _InternetState extends State<Internet> {
  late StreamSubscription subscription;
  var isDeviceConnected = false;
  bool isAlertSet = false;

  @override
  void initState() {
    super.initState();
    getConnectivity();
  }

  getConnectivity() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) async {
      isDeviceConnected = await InternetConnectionChecker().hasConnection;
      if (!isDeviceConnected && !isAlertSet) {
        showDialoglogBox();
        setState(() => isAlertSet = true);
      }
    });
  }

  // @override
  // Widget build(BuildContext context) {
  //   return const Placeholder();
  // }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  // void showDialoglogBox() {
  //   // Define your dialog here
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Connectivity Checker',
              style: TextStyle(color: Colors.amber)),
        ),
        body: Center(
            child: ElevatedButton(
                onPressed: () => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Second())),
                child: Text('Continue'))));
  }

  void showDialoglogBox() {
    showCupertinoDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return CupertinoAlertDialog(
          title: const Text('No Connection'),
          content: const Text('Please check your internet connectivity'),
          actions: <Widget>[
            TextButton(
              onPressed: () async {
                // Make the callback asynchronous
                Navigator.pop(context, 'Cancel');
                setState(() => isAlertSet = false);
                isDeviceConnected =
                    await InternetConnectionChecker().hasConnection;
                if (!isDeviceConnected) {
                  showDialoglogBox();
                  setState(() => isAlertSet = true);
                }
                // Close the dialog
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
