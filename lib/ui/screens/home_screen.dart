import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../components/components.dart';
import '../../config/config.dart';
import '../../data/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: getPHeight(20),
        horizontal: getPWidth(18),
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Provider.of<ItemManager>(context).selectedColor.withOpacity(0.7),
            Colors.white
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: getPHeight(50),
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  // TODO open Menu
                },
                icon: Icon(
                  Icons.menu_outlined,
                  size: getPHeight(43),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Center(
              child: SizedBox(
                width: getPWidth(210),
                child: Text(
                  Provider.of<ItemManager>(context).curerntItem.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: getPWidth(26),
                    color: Provider.of<ItemManager>(context).selectedColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 30,
            child: Consumer<ItemManager>(
              builder: (context, manager, _) {
                return CustomPageView(
                  itemBuilder: (context, index) {
                    return SvgPicture.asset(manager.items[index].imageUrl,
                        fit: BoxFit.scaleDown);
                  },
                  itemCount: manager.items.length,
                  onChanged: (index) {
                    manager.goToItem(index);
                    Provider.of<TimerManager>(context, listen: false).reset();
                  },
                );
              },
            ),
          ),
          Expanded(
            flex: 33,
            child: Consumer<TimerManager>(builder: (context, timerManager, _) {
              return Stack(
                alignment: Alignment.center,
                children: [
                  ClockFace(
                    currentTime: timerManager.stringDuration,
                    value: timerManager.remainingRatio,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: RoundedButton(
                      size: getPWidth(80),
                      text: "Reset",
                      onPressed: timerManager.reset,
                      textColor: Colors.white,
                      backgroundColor: const Color(0xFFAA4648),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    width: getPWidth(80),
                    child: RoundedButton(
                      size: getPWidth(86),
                      text: timerManager.isStarted ? "Pause" : "Start",
                      onPressed: timerManager.isStarted
                          ? timerManager.pause
                          : timerManager.start,
                    ),
                  ),
                ],
              );
            }),
          ),
        ],
      ),
    );
  }
}
