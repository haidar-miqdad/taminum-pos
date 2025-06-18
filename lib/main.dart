import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'app/app.dart';
import 'core/core.dart';

void main() {
  Bloc.observer = AppBlocObserver();

  runApp(const MyApp());
}

