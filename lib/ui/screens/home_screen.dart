import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../components/components.dart';
import '../../data/models/models.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 20.h,
        horizontal: 20.w,
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
            height: 50.h,
            child: Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  // TODO open Menu
                },
                icon: Icon(
                  Icons.menu_outlined,
                  size: 44.h,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 11,
            child: Center(
              child: SizedBox(
                width: 210.w,
                child: Text(
                  Provider.of<ItemManager>(context).curerntItem.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: 30.sp,
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
                      size: 80.w,
                      text: "Reset",
                      onPressed: timerManager.reset,
                      textColor: Colors.white,
                      backgroundColor: const Color(0xFFAA4648),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    width: 80.h,
                    child: RoundedButton(
                      size: 86.h,
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
