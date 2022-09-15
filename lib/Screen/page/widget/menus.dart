import 'package:flutter/material.dart';

menuList(List<dynamic> menu) {
  return SliverPadding(
    padding: EdgeInsets.all(8),
    sliver: SliverList(
        delegate: SliverChildListDelegate(
      menu.map((e) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(e.name),
            )
          ],
        );
      }).toList(),
    )),
  );
}
