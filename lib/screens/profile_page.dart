import 'package:candito5_week/feature/login/login_view.dart';
import 'package:candito5_week/screens/lifts_screen.dart';
import 'package:candito5_week/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:candito5_week/product/provider/user_provider.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Profile'),
      ),
      body: ListView(
        children: [
          CircleAvatar(
            child: Image.asset('assets/icons/example_profile_icon.png'),
          ),
          const Divider(),
          ListTile(
            title: const Text('Current Maxes'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => LiftsScreen(),
                ),
              );
            },
          ),
          ListTile(
            title: const Text('Sign Out'),
            trailing: const Icon(Icons.navigate_next),
            onTap: () async {
              final prefs = await SharedPreferences.getInstance();
              await prefs.setString('username', '');
              await Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) => const LoginView(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
