import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void showPopupMenu(BuildContext context, Offset offset) async {
  await showMenu(
    context: context,
    position: RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
    items: [
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.shield_outlined),
          title: Text('Cosy areas'),
          onTap: () {
            Navigator.pop(context);
            // Perform your action here
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.wallet_giftcard_rounded),
          title: Text('Price'),
          onTap: () {
            Navigator.pop(context);
            // Perform your action here
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.delete_outline_rounded),
          title: Text('Infrastructure'),
          onTap: () {
            Navigator.pop(context);
            // Perform your action here
          },
        ),
      ),
      PopupMenuItem(
        child: ListTile(
          leading: Icon(Icons.layers_outlined),
          title: Text('Without any layer'),
          onTap: () {
            Navigator.pop(context);
            // Perform your action here
          },
        ),
      ),
    ],
  );
}
