import 'dart:html';
import 'package:flutter/material.dart';

enum CurrentScreen {   dashboard, }

class CurrentScreenProvider extends ChangeNotifier {
  CurrentScreenProvider() {
    _loadCurrentScreen();
  }

  CurrentScreen _currentScreen = CurrentScreen.dashboard;

  CurrentScreen get currentScreen => _currentScreen;

  get currentProyasisScreen => null;

  void setCurrentScreen(CurrentScreen screen) {
    _currentScreen = screen;
    _saveCurrentScreen();
    notifyListeners();
  }

  void _saveCurrentScreen() {
    window.localStorage['currentScreen'] = _currentScreen.name;
  }

  void _loadCurrentScreen() {
    final String? screenName = window.localStorage['currentScreen'];
    if (screenName!= null) {
      _currentScreen = CurrentScreen.values.firstWhere((screen) => screen.name == screenName);
    }
  }
}