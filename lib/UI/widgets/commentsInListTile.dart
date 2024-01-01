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
          style: commentAccountName(colorGray600),
        ),
        const SizedBox(
          width: 15,
        ),
        Text(
          'time ago ',
          style: commentTime(colorGray600),
        ),
      ]),
      subtitle: Text(
        'Comment',
        style: commentContent(colorGray600),
      ));
}
