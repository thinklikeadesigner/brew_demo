import 'package:brew_demo_for_user_db_and_auth/models/user_class.dart';
import 'package:brew_demo_for_user_db_and_auth/screens/services/auth.dart';
import 'package:brew_demo_for_user_db_and_auth/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserClass>.value(
      value: AuthService().user,
      child: MaterialApp(
        home: Wrapper(),
      ),
    );
  }
}
