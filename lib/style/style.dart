import 'package:flutter/material.dart';

const colorRed = Color.fromRGBO(231, 28, 36, 1);
const colorDark = Color.fromRGBO(136, 28, 32, 1);
const colorGreen = Color.fromRGBO(33, 191, 115, 1);
const colorBlue = Color.fromRGBO(52, 152, 219, 1.0);
const colorOrange = Color.fromRGBO(230, 126, 34, 1.0);
const colorWhite = Color.fromRGBO(255, 255, 255, 1.0);
const colorDarkBlue = Color.fromRGBO(44, 62, 80, 1.0);
const colorLightGray = Color.fromRGBO(135, 142, 150, 1.0);
const colorLight = Color.fromRGBO(211, 211, 211, 1.0);
const colorBlack = Color.fromRGBO(0, 0, 0, 1.0);
const colorGray900 = Color.fromRGBO(26, 32, 44, 1);
const colorGray600 = Color.fromRGBO(113, 128, 150, 1);

TextStyle videoHeading(color) {
  return TextStyle(
    fontWeight: FontWeight.w700,
    fontSize: 25,
    fontFamily: 'inter',
    color: color,
  );
}

TextStyle homePageVideoTitle(color) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 15,
    fontFamily: 'Hind Siliguri',
    color: color,
  );
}

TextStyle homePageVideoSubtitle(color) {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    fontFamily: 'inter',
    color: color,
  );
}

TextStyle mainPageSubtitle(color) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'poppins',
    fontSize: 13,
    color: color,
  );
}

TextStyle videoDurationText(color) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'inter',
    fontSize: 13,
    color: color,
  );
}

TextStyle playingVideoHeading(color) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'Hind Siliguri',
    fontSize: 20,
    color: color,
  );
}

TextStyle reactionSubtitle(color) {
  return TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: 'poppins',
    fontSize: 13,
    color: color,
  );
}

TextStyle channelSubscriber(color) {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'poppins',
    fontSize: 14,
    color: color,
  );
}

TextStyle comment(color) {
  return TextStyle(
    fontWeight: FontWeight.w600,
    fontFamily: 'poppins',
    fontSize: 15,
    color: color,
  );
}

TextStyle commentAccountName(color) {
  return TextStyle(
    fontWeight: FontWeight.w700,
    fontFamily: 'poppins',
    fontSize: 15,
    color: color,
  );
}

TextStyle commentContent(color) {
  return TextStyle(
    fontWeight: FontWeight.w500,
    fontFamily: 'Hind Siliguri',
    fontSize: 15,
    color: color,
  );
}

TextStyle commentTime(color) {
  return TextStyle(
    fontWeight: FontWeight.w400,
    fontFamily: 'poppins',
    fontSize: 12,
    color: color,
  );
}

InputDecoration commentTextForm(label) {
  return InputDecoration(
      labelText: label,
      labelStyle: const TextStyle(fontSize: 13),
      border: const OutlineInputBorder(),
      suffixIcon: const Icon(Icons.send));
}
