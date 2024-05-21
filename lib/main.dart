// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

final logoGreen = Color(0xff1dab61);

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
        icon: Icon(Icons.chat_outlined),
        selectedIcon: Icon(Icons.chat),
        label: 'Chats',
      ),
      NavigationDestination(
        icon: Icon(Icons.update),
        label: 'Updates',
      ),
      NavigationDestination(
        icon: Icon(Icons.groups_outlined),
        selectedIcon: Icon(Icons.groups),
        label: 'Communities',
      ),
      NavigationDestination(
        icon: Icon(Icons.phone_outlined),
        selectedIcon: Icon(Icons.phone),
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
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        indicatorColor: logoGreen.withOpacity(0.24),
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
    );
  }
}

class ArchivedChatsButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        color: Colors.green[100],
        height: 48,
        child: Row(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  color: Colors.purple,
                  child: Icon(Icons.archive_outlined),
                )),
            Expanded(
                flex: 4,
                child: Container(
                  color: Colors.yellow,
                  child: Text('Archived'),
                )),
          ],
        ),
      ),
    );
  }
}

class ChatFilterChipButton extends StatelessWidget {
  const ChatFilterChipButton(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[350]!.withOpacity(0.24),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.grey[600],
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
        // color: Colors.pinkAccent[100],
        height: 64,
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ChatFilterChipButton('All'),

            SizedBox(width: 8),

            ChatFilterChipButton('Unread'),

            SizedBox(width: 8),

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
            title: Text('WhatsApp'),
            floating: true,
            backgroundColor: appBarBackgroundColor,
            surfaceTintColor: appBarBackgroundColor,
          ),
          ChatFilterTile(),
          ArchivedChatsButton(),
          MyDummyTile(Colors.grey),
          MyDummyTile(Colors.yellow),
          MyDummyTile(Colors.indigo),
          MyDummyTile(Colors.orange),
          MyDummyTile(Colors.purple),
          MyDummyTile(Colors.grey),
          MyDummyTile(Colors.brown),
          MyDummyTile(Colors.green),
          MyDummyTile(Colors.yellow),
          MyDummyTile(Colors.indigo),
          MyDummyTile(Colors.orange),
          MyDummyTile(Colors.purple),
          MyDummyTile(Colors.grey),
          MyDummyTile(Colors.brown),
          MyDummyTile(Colors.green),
          MyDummyTile(Colors.yellow),
          MyDummyTile(Colors.indigo),
          MyDummyTile(Colors.orange),
          MyDummyTile(Colors.purple),
          MyDummyTile(Colors.grey),
          MyDummyTile(Colors.brown),
        ],
      ),
    );
  }
}

class MyDummyTile extends StatelessWidget {
  MyDummyTile(this.color);

  Color color;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        height: 84,
        color: color,
        alignment: Alignment.center,
        child: Text('bla'),
      ),
    );
  }
}
