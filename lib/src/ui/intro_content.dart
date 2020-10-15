import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:introduction_screen/src/introduction_screen.dart';

class IntroContent extends StatelessWidget {
  final PageViewModel page;

  const IntroContent({Key key, @required this.page}) : super(key: key);

  Widget _buildWidget(Widget widget, String text, TextStyle style) {
    return widget ?? Text(text, style: style, textAlign: TextAlign.center);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: page.decoration.contentPadding,
      child: AnimationLimiter(
        child: Column(
          children: [
            StaggeredAnimationBaseConfiguration(
              position: 0,
              child: Padding(
                padding: page.decoration.titlePadding,
                child: _buildWidget(
                  page.titleWidget,
                  page.title,
                  page.decoration.titleTextStyle,
                ),
              ),
            ),
            StaggeredAnimationBaseConfiguration(
              position: 1,
              child: Padding(
                padding: page.decoration.descriptionPadding,
                child: _buildWidget(
                  page.bodyWidget,
                  page.body,
                  page.decoration.bodyTextStyle,
                ),
              ),
            ),
            if (page.footer != null)
              StaggeredAnimationBaseConfiguration(
                position: 2,
                child: Padding(
                  padding: page.decoration.footerPadding,
                  child: page.footer,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
