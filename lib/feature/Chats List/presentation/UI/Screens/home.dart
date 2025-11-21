import 'package:chatter/feature/Chats%20List/presentation/UI/widget/ChatTile%20.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Chat', style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 1,
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Recent Chats',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                ListView.builder(
                  itemBuilder: (context, index) {
                    return ChatTile();
                  },
                  itemCount: 15,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
                // Add more widgets here as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
