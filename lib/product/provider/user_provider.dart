import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserProvider extends ChangeNotifier {
  int _squat = 150;
  int _bench = 150;
  int _deadlift = 150;

  int get squat => _squat;
  set squat(int newValue) {
    _squat = newValue;
    notifyListeners();
  }

  int get bench => _bench;
  set bench(int newValue) {
    _bench = newValue;
    notifyListeners();
  }

  int get deadlift => _deadlift;
  set deadlift(int newValue) {
    _deadlift = newValue;
    notifyListeners();
  }

    Future<void> saveData() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('squat', _squat);
    await prefs.setInt('bench', _bench);
    await prefs.setInt('deadlift', _deadlift);
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    _squat = prefs.getInt('squat') ?? 150;
    _bench = prefs.getInt('bench') ?? 150;
    _deadlift = prefs.getInt('deadlift') ?? 150;
    notifyListeners();
  }
}
