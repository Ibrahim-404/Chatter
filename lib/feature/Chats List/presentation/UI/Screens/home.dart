import 'package:chatter/feature/Chats%20List/presentation/UI/widget/ChatTile%20.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();
  HomeScreen({super.key});
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
      ),
    );
  }
}

class CustomSearchWidget extends StatefulWidget {
  final TextEditingController searchController;
  const CustomSearchWidget({super.key, required this.searchController});

  @override
  State<CustomSearchWidget> createState() => _CustomSearchWidgetState();
}

class _CustomSearchWidgetState extends State<CustomSearchWidget> {
 
 
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: widget.searchController,
        decoration: InputDecoration(
          icon: Icon(Icons.search, color: Colors.grey),
          hintText: 'Search',
          border: InputBorder.none,
        ),
      ),
    );
  }
}
