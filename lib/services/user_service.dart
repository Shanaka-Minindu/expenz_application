import 'package:expenz_app/screens/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserServices {
  static Future<void> storeUserDetails(
    String userName,
    String email,
    String password,
    String confirmPassword,
    BuildContext context,
  ) async {
    try {
      if (password != confirmPassword) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Passeword and Confirm Password not matring"),
          ),
        );
        return;
      }

      SharedPreferences prefs = await SharedPreferences.getInstance();

      await prefs.setString("userName", userName);
      await prefs.setString("email", email);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("User details stored successfully"),
        ),
      );

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return MainScreen();
          },
        ),
      );
    } catch (err) {
      err.toString();
    }
  }
}
