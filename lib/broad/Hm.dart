// import 'dart:async';
// import 'package:connectivity/connectivity.dart';
// import 'package:flutter/material.dart';
// import 'package:internet_connection_checker/internet_connection_checker.dart';

// class Hm extends StatefulWidget {
//   const Hm({Key? key}) : super(key: key);

//   @override
//   State<Hm> createState() => _HmState();
// }

// class _HmState extends State<Hm> {
//   late StreamSubscription subscription;
//   var isDeviceConnected = false;
//   bool isAlertSet = false;

//   @override
//   void initState() {
//     super.initState();
//     getConnectivity();
//   }

//   getConnectivity() {
//     subscription = Connectivity()
//         .onConnectivityChanged
//         .listen((ConnectivityResult result) async {
//       isDeviceConnected = await InternetConnectionChecker().hasConnection;
//       if (!isDeviceConnected && !isAlertSet) {
//         showDialoglogBox();
//         setState(() => isAlertSet = true);
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }

//   @override
//   void dispose() {
//     subscription.cancel();
//     super.dispose();
//   }

//   void showDialoglogBox() {
//     // Define your dialog here
//   }
// }
