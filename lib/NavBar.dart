import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'CalculatorScreen.dart';
import 'Seth/About.dart';
import 'Seth/Welcome.dart';
import 'Seth/Contact.dart';
import 'Login.dart';

// Import the file where ThemeNotifier is defined
import 'main.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          Consumer<ThemeNotifier>(
            builder: (context, themeNotifier, child) {
              return UserAccountsDrawerHeader(
                accountName: Text('SethMaurice'),
                accountEmail: Text('sethmaurice1@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  child: ClipOval(
                    child: Image.network(
                      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQpNwqf6J_9gTVI2WstcXXkG8ZtC91wMxCWg&usqp=CAU',
                      width: 90,
                      height: 90,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://binarapps.com/wp-content/uploads/2020/12/15.Benefits-of-flutter-what-are-the-advantages-.png',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.home),
            title: Text('Home'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Welcome()));
            },
          ),
          ListTile(
            leading: Icon(Icons.calculate),
            title: Text('Calculator'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => CalculatorScreen()));
            },
          ),
          ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            leading: Icon(Icons.contacts),
            title: Text('Contact'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.exit_to_app),
            title: Text('Exit'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, '/main');
            },
          ),
        ],
      ),
    );
  }
}
