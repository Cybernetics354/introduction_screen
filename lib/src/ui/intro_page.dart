import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:introduction_screen/src/introduction_screen.dart';
import 'package:introduction_screen/src/model/page_view_model.dart';
import 'package:introduction_screen/src/ui/intro_content.dart';

class IntroPage extends StatelessWidget {
  final PageViewModel page;

  const IntroPage({Key key, @required this.page}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: page.decoration.pageColor,
      decoration: page.decoration.boxDecoration,
      child: SafeArea(
        top: false,
        child: AnimationLimiter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              if (page.image != null)
                Expanded(
                  flex: page.decoration.imageFlex,
                  child: StaggeredAnimationBaseConfiguration(
                    position: 0,
                    isUp: false,
                    child: Padding(
                      padding: page.decoration.imagePadding,
                      child: page.image,
                    ),
                  ),
                ),
              Expanded(
                flex: page.decoration.bodyFlex,
                child: StaggeredAnimationBaseConfiguration(
                  position: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 70.0),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: IntroContent(page: page),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
