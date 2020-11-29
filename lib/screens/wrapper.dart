import 'package:brew_demo_for_user_db_and_auth/models/user_class.dart';
import 'package:brew_demo_for_user_db_and_auth/screens/authenticate/authenticate.dart';
import 'package:brew_demo_for_user_db_and_auth/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserClass>(context);
    print(user);

    //return either home or authenticate widget

    if (user == null) {
      return Authenticate();
    } else {
      return Home();
    }
  }
}
