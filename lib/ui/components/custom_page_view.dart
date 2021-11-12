import 'package:flutter/material.dart';

import '../../config/config.dart';
import '../../data/models/models.dart';

List<Widget> pages = [
  Container(color: Colors.blue),
  Container(color: Colors.green),
  Container(color: Colors.red),
];

class CustomPageView extends StatefulWidget {
  final Function(int) onChanged;
  final Widget Function(BuildContext, int) itemBuilder;
  final int itemCount;

  CustomPageView({
    Key? key,
    required this.itemBuilder,
    required this.itemCount,
    required this.onChanged,
  }) : super(key: key);

  @override
  State<CustomPageView> createState() => _CustomPageViewState();
}

class _CustomPageViewState extends State<CustomPageView> {
  final _pageController = PageController();
  late int _seletedPage = 0;

  void goToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 500),
      curve: Curves.ease,
    );
    widget.onChanged(pageIndex);
  }

  void goToNextPage() {
    final newPage = _seletedPage + 1;
    if (newPage == widget.itemCount) {
      _seletedPage = 0;
    } else {
      _seletedPage = newPage;
    }

    goToPage(_seletedPage);
  }

  void goToPreviousPage() {
    final newPage = _seletedPage - 1;
    if (newPage == -1) {
      _seletedPage = widget.itemCount - 1;
    } else {
      _seletedPage = newPage;
    }
    goToPage(_seletedPage);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: goToPreviousPage,
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            size: getPWidth(44),
          ),
        ),
        Expanded(
          child: PageView.builder(
            controller: _pageController,
            itemBuilder: widget.itemBuilder,
            itemCount: pages.length,
            onPageChanged: widget.onChanged,
          ),
        ),
        InkWell(
          onTap: goToNextPage,
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: getPWidth(44),
          ),
        ),
      ],
    );
  }
}
