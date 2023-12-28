import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../style/style.dart';

Widget reactionCard(String imagePath, String label) {
  return Container(
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
      border: Border.all(color: colorLightGray, width: 1.0),
      borderRadius:
          BorderRadius.circular(8.0),
    ),
    child: Column(
      children: [
        SvgPicture.asset(
          imagePath,
          width: 22,
          height: 22,
          color: colorLightGray,
        ),
        const SizedBox(height: 3),
        Text(
          label,
          style: reactionSubtitle(colorLightGray),
        ),
      ],
    ),
  );
}
