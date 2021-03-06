import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sunflower/app.dart';
import 'package:sunflower/simple_bloc_observer.dart';

void main() {
  BlocOverrides.runZoned(
        () => runApp(App()),
    blocObserver: SimpleBlocObserver(),
  );
}