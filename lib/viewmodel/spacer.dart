import 'package:flutter/material.dart';

class SizerR extends StatelessWidget {
  const SizerR({
    super.key,
    required this.height,
    required this.width,

  });

  final double height;
  final double width;


  @override
  Widget build(BuildContext context) {
    return SizedBox(height:height ,width: width,);
  }
}
