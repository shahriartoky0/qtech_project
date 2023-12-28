
import 'package:flutter/material.dart';

import '../../style/style.dart';

ListTile commentsInListTile() {
  return ListTile(
      leading: CircleAvatar(
        child: Icon(Icons.person_add_alt_sharp),
      ),
      title: Row(children: [
        Text(
          'Account Holder Name',
          style: commentAccountName(colorLightGray),
        ),
        SizedBox(
          width: 15,
        ),
        Text(
          'time ago ',
          style: commentTime(colorLightGray),
        ),
      ]),
      subtitle: Text('Description'));
}
