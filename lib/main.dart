// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:wazzap/archived_chats.dart';
import 'package:wazzap/conversation.dart';

const logoGreen = Color(0xff1dab61);

const darkGreen = Color(0xff11613e);

const anotherGreen = Color(0xff1bd741);

const navBarIndicatorGreen = Color(0xffd8fdd2);

const lighterBlack = Color(0xff303030);

const filterChipGrey = Color(0xfff6f5f3);

const darkGrey = Color(0xff647681);

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int currPage = 0;

  final pageController = PageController(initialPage: 0);

  List<NavigationDestination> bottomNavDestinations() {
    return const [
      NavigationDestination(
        icon: Icon(Icons.chat_outlined, color: lighterBlack),
        selectedIcon: Icon(
          Icons.chat,
          color: darkGreen,
        ),
        label: 'Chats',
      ),
      NavigationDestination(
        icon: Icon(Icons.update, color: lighterBlack),
        label: 'Updates',
      ),
      NavigationDestination(
        icon: Icon(Icons.groups_outlined, color: lighterBlack),
        selectedIcon: Icon(Icons.groups, color: darkGreen),
        label: 'Communities',
      ),
      NavigationDestination(
        icon: Icon(Icons.phone_outlined, color: lighterBlack),
        selectedIcon: Icon(Icons.phone, color: darkGreen),
        label: 'Calls',
      ),
    ];
  }

  Widget body(int currentPage) {
    return [
      ChatsBody(),
      Container(
        color: Colors.blue[100],
        constraints: BoxConstraints.expand(),
        alignment: Alignment.center,
        child: Text('Updates'),
      ),
      Container(
        color: Colors.green[100],
        constraints: BoxConstraints.expand(),
        alignment: Alignment.center,
        child: Text('Communities'),
      ),
      Container(
        color: Colors.orange[100],
        constraints: BoxConstraints.expand(),
        alignment: Alignment.center,
        child: Text('Calls'),
      ),
    ][currentPage];
  }

  @override
  Widget build(BuildContext context) {
    return NavigationBarTheme(
      data: NavigationBarTheme.of(context).copyWith(
          labelTextStyle: WidgetStateTextStyle.resolveWith((states) {
        if (states.any((s) {
          return s == WidgetState.selected;
        })) {
          return TextStyle(
              fontSize: 14, color: lighterBlack, fontWeight: FontWeight.w600);
        } else {
          return TextStyle(
              fontSize: 14, color: lighterBlack, fontWeight: FontWeight.w400);
        }
      })),
      child: Scaffold(
        bottomNavigationBar: NavigationBar(
          elevation: 4,
          backgroundColor: Colors.white,
          indicatorColor: navBarIndicatorGreen,
          onDestinationSelected: (newIndex) {
            pageController.jumpToPage(newIndex);
          },
          selectedIndex: currPage,
          destinations: bottomNavDestinations(),
        ),
        body: PageView(
          controller: pageController,
          onPageChanged: (newPageIndex) {
            setState(() {
              currPage = newPageIndex;
            });
          },
          children: [
            ChatsBody(),
            Container(
              color: Colors.blue[100],
              constraints: BoxConstraints.expand(),
              alignment: Alignment.center,
              child: Text('Updates'),
            ),
            Container(
              color: Colors.green[100],
              constraints: BoxConstraints.expand(),
              alignment: Alignment.center,
              child: Text('Communities'),
            ),
            Container(
              color: Colors.orange[100],
              constraints: BoxConstraints.expand(),
              alignment: Alignment.center,
              child: Text('Calls'),
            ),
          ],
        ),
      ),
    );
  }
}

class ArchivedChatsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) {
              return ArchivedChatsScreen();
            }));
          },
          child: Container(
            padding: EdgeInsets.only(left: 18),
            child: Row(
              children: [
                Container(
                  // color: Colors.blue[100],
                  height: 48,
                  width: 48,
                  alignment: Alignment.center,
                  child: Icon(
                    Icons.archive_outlined,
                    color: lighterBlack,
                  ),
                ),
                SizedBox(width: 16),
                Container(
                  // color: Colors.yellow,
                  child: Text(
                    'Archived',
                    style: TextStyle(
                        color: lighterBlack,
                        fontSize: 15,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ChatFilterChipButton extends StatelessWidget {
  const ChatFilterChipButton(this.text, {this.selected = false});

  final String text;

  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: selected ? navBarIndicatorGreen : filterChipGrey,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: selected ? darkGreen : darkGrey,
        ),
      ),
    );
  }
}

class ChatFilterTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(left: 18),
        height: 64,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ChatFilterChipButton('All', selected: true),
            SizedBox(width: 6),
            ChatFilterChipButton('Unread'),
            SizedBox(width: 6),
            ChatFilterChipButton('Groups'),
          ],
        ),
      ),
    );
  }
}

class ChatsBody extends StatelessWidget {
  static const appBarBackgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red[100],
      constraints: BoxConstraints.expand(),
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(
              'WhatsApp',
              style: TextStyle(color: logoGreen, fontWeight: FontWeight.w600),
            ),
            shape: ContinuousRectangleBorder(
              side: BorderSide(
                color: Colors.grey[300]!,
                width: 0.0,
              ),
            ),
            floating: true,
            backgroundColor: appBarBackgroundColor,
            surfaceTintColor: appBarBackgroundColor,
            actions: [
              IconButton(
                  onPressed: () {}, icon: Icon(Icons.camera_alt_outlined)),
              IconButton(onPressed: () {}, icon: Icon(Icons.search_rounded)),
              IconButton(onPressed: () {}, icon: Icon(Icons.more_vert_rounded)),
            ],
          ),
          ChatFilterTile(),
          ArchivedChatsButton(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
          MyDummyTile(),
        ],
      ),
    );
  }
}

class MyDummyTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Material(
        color: Colors.white,
        child: InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) {
              return ConversationScreen();
            }));
          },
          child: Container(
            // height: 84,
            padding: EdgeInsets.only(left: 18, top: 14, bottom: 14, right: 16),
            child: Row(
              children: [
                Container(
                  height: 48,
                  width: 48,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    // color: Colors.red[100],
                    shape: BoxShape.circle,
                  ),
                  child: Image.asset(
                    'assets/images/mulanzinha.jpg',
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: Container(
                    // color: Colors.green[100],
                    child: Column(
                      children: [
                        Container(
                          // color: Colors.purple[100],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Adilson',
                                  style: TextStyle(
                                      color: lighterBlack,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600)),
                              Text('09:08',
                                  style:
                                      TextStyle(fontSize: 11, color: darkGrey)),
                            ],
                          ),
                        ),
                        Container(
                          // color: Colors.indigo[100],
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text('Muito bem!',
                                  style: TextStyle(color: darkGrey)),
                              Icon(
                                Icons.pin_drop,
                                size: 16,
                                color: darkGrey,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
