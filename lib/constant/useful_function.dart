import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class UsefulFunction{
  UsefulFunction._();

  static Widget buildProgressIndicator() {
    return Container(
      color: Colors.black.withOpacity(0.5),
      child: Center(
        child: LoadingAnimationWidget.twistingDots(
          size: 50,
          leftDotColor: Colors.blue,
          rightDotColor: Colors.green,
        ),
      ),
    );
  }
}