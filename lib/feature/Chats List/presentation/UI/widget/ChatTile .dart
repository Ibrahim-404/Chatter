import 'package:chatter/core/constants/assets.dart';
import 'package:chatter/feature/Chats%20List/presentation/UI/widget/showCustomBottomSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ChatTile extends StatelessWidget {
  final Widget? changeableWidget;
  const ChatTile({super.key, this.changeableWidget});
  @override
  Widget build(BuildContext context) {
    return CustomSlidable(changeableWidget: changeableWidget);
  }
}

class CustomSlidable extends StatelessWidget {
  const CustomSlidable({super.key, required this.changeableWidget});

  final Widget? changeableWidget;

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: ValueKey(0),
      endActionPane: ActionPane(
        motion: ScrollMotion(),
        children: [
          SlidableAction(
            onPressed: (ctx) {
              showCustomBottomSheet(context);
            },
            backgroundColor: Colors.grey,
            icon: Icons.more_horiz,
            label: 'More',
          ),
          SlidableAction(
            onPressed: (ctx) {},
            backgroundColor: Colors.blue,
            icon: Icons.archive,
            label: 'Archive',
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
