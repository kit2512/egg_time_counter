import 'package:flutter/material.dart';
import 'package:time_counter/config/config.dart';

import '../components/components.dart';
import 'home_screen.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaConfig.init(context);
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        body: HomeScreen(),
      ),
    );
  }
}
