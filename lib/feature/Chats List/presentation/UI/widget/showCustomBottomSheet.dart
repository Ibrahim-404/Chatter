import 'package:flutter/material.dart';

Future<void> showCustomBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(title: Text('Mute'), onTap: () {}),
            ListTile(title: Text('Contact info'), onTap: () {}),
            ListTile(title: Text('Clear Chat'), onTap: () {}),
            ListTile(
              title: Text('Delete Chat', style: TextStyle(color: Colors.red)),
              onTap: () {},
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(14),
              ),
              child: TextButton(
                onPressed: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 14),
                  child: Text(
                    "Cancel",
                    style: TextStyle(fontSize: 16, color: Colors.black),
                  ),
                ),
              ),
            ),

            SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
