import 'package:chatter/core/constants/assets.dart';
import 'package:flutter/material.dart';

class ChatTile extends StatelessWidget {
  Widget? changeableWidget;
  ChatTile({super.key, this.changeableWidget});
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      direction: DismissDirection.endToStart,
      key: UniqueKey(),
      onDismissed: (direction) {},
      background: Row(
        children: [
          DismissibleSwibeWidget(
            color: Colors.grey,
            text: 'More',
            onTap: () {},
            icon: Icons.more_horiz,
          ),
          DismissibleSwibeWidget(
            color:Color(0xFF3E70A7),
            text: 'Archive',
            onTap: () {},
            icon: Icons.archive,
          ),
        ],
      ),

      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25,
                backgroundImage: AssetImage(Assets.userPhoto),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Username',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '12:45 PM',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        // SizedBox(height: 5),
                        Expanded(
                          child: Text(
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            'Last message preview...',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontSize: 14,
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Icon(Icons.arrow_forward_ios),
                        ),
                      ],
                    ),

                    changeableWidget ?? SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DismissibleSwibeWidget extends StatelessWidget {
  final Color color;
  final String text;
  final void Function()? onTap;
  final IconData? icon;
  const DismissibleSwibeWidget({
    super.key,
    required this.color,
    required this.text,
    required this.onTap,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        color: color,
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: Colors.white),
            SizedBox(height: 4),
            Text(text, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
