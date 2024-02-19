import 'package:flutter/material.dart';
import 'package:calculator/Register.dart';
import 'package:calculator/Seth/Welcome.dart'; // Import the homepage
import 'package:calculator/NavBar.dart'; // Import the homepage

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Controller for the username and password text fields
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    // Function to check credentials
    void checkCredentials() {
      // Check if the username and password match
      if (usernameController.text == 'admin' &&
          passwordController.text == '1234') {
        // Navigate to the homepage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Welcome()),
        );
      } else {
        // Show a popup message if credentials are incorrect
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Login Failed', style: TextStyle(color: Colors.red)),
              content: Text('Username or password not matching. Please retry!'),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Username',
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Perform login logic here
                checkCredentials(); // Call the function to check credentials
              },
              child: Text('Login'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Register(),
                  ),
                );
              },
              child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.g_mobiledata_outlined),
                  label: Text('Signup with google')),
              // Text('Sign Up with Google'),
            ),
          ],
        ),
      ),
    );
  }
}
