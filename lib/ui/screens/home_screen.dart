import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../components/components.dart';
import '../../config/config.dart';
import '../../data/models/models.dart';

List<Item> items = <Item>[
  Item(
      duration: const Duration(seconds: 3),
      name: "Soft Boiled Eggs",
      imageUrl: "assets/images/egg_1.svg"),
  Item(
      duration: const Duration(seconds: 4),
      name: "Hard Boiled Eggs",
      imageUrl: "assets/images/egg_2.svg"),
  Item(
      duration: const Duration(seconds: 5),
      name: "Liquid Boiled Egges",
      imageUrl: "assets/images/egg_3.svg"),
];

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
          colors: [kPrimaryColor.withOpacity(0.7), Colors.white],
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
                  "Soft Boiled Eggs",
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  style: TextStyle(
                    fontSize: getPWidth(26),
                    color: kPrimaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
              flex: 30,
              child: CustomPageView(
                itemBuilder: (context, index) {
                  return SvgPicture.asset(items[index].imageUrl,
                      fit: BoxFit.scaleDown);
                },
                itemCount: items.length,
              )),
          Expanded(
            flex: 33,
            child: Column(
              children: [
                Text(
                  "3 minutes",
                  style: TextStyle(
                    fontSize: getPWidth(18),
                    color: const Color(0xFFAA4648),
                  ),
                ),
                SizedBox(
                  height: getPHeight(8),
                ),
                SizedBox(
                  height: getPWidth(200),
                  child: AspectRatio(
                    aspectRatio: 1 / 1,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(getPHeight(6)),
                          constraints: const BoxConstraints.expand(),
                          child: CircularProgressIndicator(
                            strokeWidth: getPHeight(8),
                            backgroundColor: kPrimaryColor,
                            // TODO: replace with percentage
                            value: 0.25,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          // TODO: Replace with remaining time
                          "2:47",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontSize: getPWidth(36),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        width: getPWidth(86),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            "Stop",
                            style: TextStyle(
                                fontSize: getPWidth(20),
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            // TODO: Stop,
                          },
                        ),
                      ),
                      SizedBox(
                        width: getPWidth(86),
                        child: TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.white,
                            shape: CircleBorder(),
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            "Stop",
                            style: TextStyle(
                                fontSize: getPWidth(20),
                                fontWeight: FontWeight.w500),
                          ),
                          onPressed: () {
                            // TODO: Stop,
                          },
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
