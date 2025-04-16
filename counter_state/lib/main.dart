import 'package:counter_state/counter_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const CounterApp());
}

