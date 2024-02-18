import 'package:flutter/material.dart';

import '../utils/common.dart';

class Details extends StatelessWidget {
  const Details({
    super.key,
    required this.width,
    required this.title,
    required this.respo
  });

  final double width;
  final String title;
  final String respo;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Constant.textWithPro(title, 14, FontWeight.w600, Constant.black),
          Constant.textWithPro(respo, 12, FontWeight.w400, Constant.black),

        ],
      ),
    );
  }
}