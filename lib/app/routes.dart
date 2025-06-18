
import 'package:flutter/material.dart';

import '../features/features.dart';

Route<dynamic> routes(settings){
  switch(settings.name){
    case MainPage.routeName:
      return MaterialPageRoute(builder: (context) => const MainPage());
    case ProfilePage.routeName:
      return MaterialPageRoute(builder: (context) => const ProfilePage());
    default:
      return MaterialPageRoute(builder: (context) {
        return Scaffold(
          body: Center(
            child: Text('Page not found: ${settings.name}'),
          ),
        );
      });
  }
}