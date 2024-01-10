import 'package:candito5_week/feature/login/login_view.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

mixin LoginMixin on State<LoginView> {
  Future<bool> loginUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    final registeredUsers = prefs.getStringList('users') ?? [];

    if (registeredUsers.contains(username)) {
      // Username exists, proceed to log in
      return true;
    } else {
      await registerUser(username);
      await prefs.setString('username', username);
      return true;
    }
  }

  Future<void> registerUser(String username) async {
    final prefs = await SharedPreferences.getInstance();
    final registeredUsers = prefs.getStringList('users') ?? [];

    if (!registeredUsers.contains(username)) {
      registeredUsers.add(username);
      await prefs.setStringList('users', registeredUsers);
    }
  }
}
