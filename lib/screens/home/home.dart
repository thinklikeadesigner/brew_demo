import 'package:brew_demo_for_user_db_and_auth/screens/services/auth.dart';
import 'package:brew_demo_for_user_db_and_auth/shared/loading.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final AuthService _auth = AuthService();

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.brown[100],
            appBar: AppBar(
              title: Text('Brew Crew'),
              backgroundColor: Colors.brown[400],
              elevation: 0.0,
              actions: <Widget>[
                FlatButton.icon(
                    icon: Icon(Icons.person),
                    label: Text('logout'),
                    onPressed: () async {
                      setState(() => loading = true);
                      await _auth.signOut();
                    })
              ],
            ),
          );
  }
}
