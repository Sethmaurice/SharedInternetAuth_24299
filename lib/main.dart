import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CalculatorScreen.dart';
import 'NavBar.dart';
import 'Login.dart';
import 'Register.dart';
import 'package:calculator/Seth/Welcome.dart';
import 'package:calculator/broad/Internet.dart';
import 'package:calculator/Vid/Camera.dart';

void main() {
  runApp(
    ChangeNotifierProvider<ThemeNotifier>(
      create: (_) => ThemeNotifier(ThemeMode.light),
      child: MainApp(),
    ),
  );
}

class ThemeNotifier extends ValueNotifier<ThemeMode> {
  ThemeNotifier(ThemeMode value) : super(value);

  void toggleTheme() {
    value = value == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
  }
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: context.watch<ThemeNotifier>().value,
      home: MyHomePage(),
      routes: {
        '/login': (context) => Login(),
        '/Register': (context) => Register(),
        '/welcome': (context) => Welcome(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SethMIS'),
        shadowColor: Colors.red,
        actions: [
          IconButton(
            icon: Icon(Icons.dark_mode),
            onPressed: () {
              context.read<ThemeNotifier>().toggleTheme();
            },
          ),
        ],
      ),
      drawer: NavBar(),
      body: Welcome(),
    );
  }
}
