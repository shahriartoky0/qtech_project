
import 'package:flutter/material.dart';

import '../../style/style.dart';

ListTile commentsInListTile() {
  return ListTile(
      leading: const CircleAvatar(
        child: Icon(Icons.person_add_alt_sharp),
      ),
      title: Row(children: [
        Text(
          'Account Name',
          style: commentAccountName(colorLightGray),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          'time ago ',
          style: commentTime(colorLightGray),
        ),
      ]),
      subtitle: const Text('Comment'));
}
