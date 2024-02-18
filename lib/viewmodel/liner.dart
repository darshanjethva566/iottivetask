import 'package:flutter/material.dart';

import '../utils/common.dart';

class Liner extends StatelessWidget {
  const Liner({
    super.key,
    required this.width,
    required this.height,
  });

  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: width*0.025),
      child: Container(height: height*0.03,width: 1.5,color: Constant.black,),
    );
  }
}
class LinerW extends StatelessWidget {
  const LinerW({
    super.key,
    required this.width,
    required this.clr
  });

  final double width;
  final Color clr;

  @override
  Widget build(BuildContext context) {
    return Container(width: width,height: 2,color: clr,);
  }
}