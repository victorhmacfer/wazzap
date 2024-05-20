import 'package:flutter/material.dart';

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
      Container(
        color: Colors.red[100],
        constraints: BoxConstraints.expand(),
        alignment: Alignment.center,
        child: Text('Chats'),
      ),
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
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('WhatsApp'),
      ),
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (i) {
          setState(() {
            currPage = i;
          });
        },
        selectedIndex: currPage,
        destinations: bottomNavDestinations(),
      ),
      body: body(currPage),
    );
  }
}
