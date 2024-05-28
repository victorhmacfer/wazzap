// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:wazzap/main.dart';

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

class _MyBottomSheet extends StatefulWidget {
  @override
  State<_MyBottomSheet> createState() => _MyBottomSheetState();
}

class _MyBottomSheetState extends State<_MyBottomSheet> {
  bool isTyping = false;

  Widget? widgetTrailingChatInputField;

  Widget? widgetInGreenButton;

  final myController = TextEditingController();

  Widget _threeWidgets() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {},
            icon: Icon(Icons.attach_file_rounded)),
        IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {},
            icon: Icon(Icons.add_circle_outline_rounded)),
        IconButton(
            visualDensity: VisualDensity.compact,
            onPressed: () {},
            icon: Icon(Icons.camera_alt_outlined)),
      ],
    );
  }

  Widget _oneWidget() {
    return IconButton(
        visualDensity: VisualDensity.compact,
        onPressed: () {},
        icon: Icon(Icons.attach_file_rounded));
  }

  Widget micIcon() {
    return Icon(
      key: ValueKey<int>(0),
      Icons.mic,
      color: Colors.white,
    );
  }

  Widget sendIcon() {
    return Icon(
      key: ValueKey<int>(1),
      Icons.send,
      color: Colors.white,
    );
  }

  @override
  void initState() {
    super.initState();
    widgetTrailingChatInputField = _threeWidgets();
    widgetInGreenButton = micIcon();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green[100],
      padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
      constraints: BoxConstraints(maxHeight: 150),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                color: Colors.orange[100],
                borderRadius: BorderRadius.circular(24)),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
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
                    color: Colors.blue[100],
                    child: TextField(
                      controller: myController,
                      onChanged: (newText) {
                        if (newText.isEmpty) {
                          setState(() {
                            isTyping = false;
                            // widgetTrailingChatInputField = _threeWidgets();

                            widgetInGreenButton = micIcon();
                          });

                          isTyping = false;
                        } else if (newText.length == 1) {
                          setState(() {
                            isTyping = true;
                            // widgetTrailingChatInputField = _oneWidget();
                            widgetInGreenButton = sendIcon();
                          });
                        }
                      },
                      maxLines: null,
                      decoration: InputDecoration(hintText: 'Message'),
                    ),
                  ),
                ),
                AnimatedSwitcher(
                  duration: Duration(milliseconds: 200),
                  transitionBuilder:
                      (Widget child, Animation<double> animation) {
                    return ScaleTransition(scale: animation, child: child);
                  },
                  child: widgetTrailingChatInputField,
                ),
              ],
            ),
          )),
          SizedBox(width: 4),
          Container(
            height: 48,
            width: 48,
            decoration: BoxDecoration(color: logoGreen, shape: BoxShape.circle),
            child: AnimatedSwitcher(
              duration: Duration(milliseconds: 200),
              transitionBuilder: (Widget child, Animation<double> animation) {
                return ScaleTransition(scale: animation, child: child);
              },
              child: widgetInGreenButton,
            ),
          ),
        ],
      ),
    );
  }
}

// class _ChatInputField extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       decoration: BoxDecoration(
//           color: Colors.orange[100], borderRadius: BorderRadius.circular(24)),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.end,
//         children: [
//           Container(
//             // color: Colors.purple[100],
//             child: IconButton(
//               visualDensity: VisualDensity.compact,
//               onPressed: () {},
//               icon: Icon(Icons.mood),
//             ),
//           ),
//           Expanded(
//             child: Container(
//               // width: 150,
//               // alignment: Alignment.center,
//               color: Colors.blue[100],
//               child: TextField(
//                 maxLines: null,
//                 decoration: InputDecoration(hintText: 'Message'),
//               ),
//             ),
//           ),
//           IconButton(
//               visualDensity: VisualDensity.compact,
//               onPressed: () {},
//               icon: Icon(Icons.attach_file_rounded)),
//           IconButton(
//               visualDensity: VisualDensity.compact,
//               onPressed: () {},
//               icon: Icon(Icons.add_circle_outline_rounded)),
//           IconButton(
//               visualDensity: VisualDensity.compact,
//               onPressed: () {},
//               icon: Icon(Icons.camera_alt_outlined)),
//         ],
//       ),
//     );
//   }
// }
