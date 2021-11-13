import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:time_counter/config/config.dart';

import 'data/models/models.dart';
import 'ui/screens/screens.dart';

void main() => runApp(const TimeCounterApp());

class TimeCounterApp extends StatelessWidget {
  const TimeCounterApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ItemManager>(create: (context) => ItemManager()),
        ChangeNotifierProxyProvider<ItemManager, TimerManager>(
          create: (context) => TimerManager(duration: const Duration()),
          update: (context, itemManager, timerManager) =>
              TimerManager(duration: itemManager.curerntItem.duration),
        )
      ],
      child: Consumer<ItemManager>(
        builder: (context, manager, _) {
          return ScreenUtilInit(
            designSize: const Size(390.0, 844.0),
            builder: () => MaterialApp(
              theme: ThemeData(
                splashColor: kPrimaryColor,
                fontFamily: 'Open Sans',
                primaryColor: kPrimaryColor,
                iconTheme: IconThemeData(color: manager.selectedColor),
              ),
              home: const Home(),
            ),
          );
        },
      ),
    );
  }
}
