import 'package:flutter/material.dart';
import 'package:sunflower/group/view/pick_your_own_screen.dart';

class App extends MaterialApp {
  App({Key? key}) : super(key: key,
    home: PickYourOwnScreen(),
    debugShowCheckedModeBanner: false,
    color: Colors.red
  );
}
