// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ConversationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: ContinuousRectangleBorder(
          side: BorderSide(
            color: Colors.grey[300]!,
            width: 0.0,
          ),
        ),
        leading: Container(
          color: Colors.red,
          alignment: Alignment.center,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.arrow_back),
              Container(
                height: 40,
                width: 40,
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: Image.asset(
                  'assets/images/mulanzinha.jpg',
                ),
              ),
            ],
          ),
        ),
        leadingWidth: 68,
        titleSpacing: 12,
        title: Container(
          color: Colors.blue,
          alignment: Alignment.centerLeft,
          child: Text('blaa'),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.video_camera_back_outlined,
                size: 26,
              )),
          IconButton(onPressed: () {}, icon: Icon(Icons.phone_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
        ],
      ),
      body: Container(
        color: Colors.red[100],
        alignment: Alignment.center,
        child: Text('sunda'),
      ),
      bottomSheet: _MyBottomSheet(),
    );
  }
}

class _MyBottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      constraints: BoxConstraints(maxHeight: 150),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(child: _ChatInputField()),
          Container(
            height: 56,
            color: Colors.green,
            width: 48,
          ),
        ],
      ),
    );
  }
}

class _ChatInputField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.orange[100], borderRadius: BorderRadius.circular(40)),
      child: Row(
        children: [
          Container(
            // color: Colors.purple[100],
            child: IconButton(
              visualDensity: VisualDensity.compact,
              onPressed: () {},
              icon: Icon(Icons.mood),
            ),
          ),
          Expanded(
            child: Container(
              // width: 150,
              color: Colors.blue[100],
              child: TextField(
                maxLines: null,
              ),
            ),
          ),

          IconButton(visualDensity: VisualDensity.compact, onPressed: () {}, icon: Icon(Icons.attach_file_rounded)),
          IconButton(visualDensity: VisualDensity.compact, onPressed: () {}, icon: Icon(Icons.add_circle_outline_rounded)),
          IconButton(visualDensity: VisualDensity.compact, onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
        ],
      ),
    );
  }
}
