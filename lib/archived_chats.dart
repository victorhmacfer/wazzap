import 'package:flutter/material.dart';

class ArchivedChatsScreen extends StatelessWidget {
  const ArchivedChatsScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Archived'),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red[100],
      constraints: BoxConstraints.expand(),
      alignment: Alignment.center,
      child: Text('Archived chats'),
    );
  }
}
