import 'package:chatter/feature/Chats%20List/presentation/UI/widget/ChatTile%20.dart';
import 'package:chatter/feature/Chats%20List/presentation/UI/widget/customSearchWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final TextEditingController searchController = TextEditingController();
  HomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
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
              CustomSearchWidget(searchController: searchController),
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
    );
  }
}
