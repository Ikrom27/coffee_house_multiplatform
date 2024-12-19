import 'package:coffee_house/ui/pages/CartPage.dart';
import 'package:coffee_house/ui/pages/HistoryPage.dart';
import 'package:coffee_house/ui/pages/MenuPage.dart';
import 'package:coffee_house/ui/pages/ProductInfo.dart';
import 'package:coffee_house/ui/pages/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'di/ServiceLocator.dart';

void main() {
  setupLocator();
  runApp(
      ProviderScope(
          child: MaterialApp(
            initialRoute: '/menu',
            routes: {
              '/menu': (context) => MyHomePage(title: 'Product App'),
              '/menu/info': (context) => ProductInfoPage(),
            },
          )
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
          scaffoldBackgroundColor: Color(0xfff9f9f9)
      ),
      home: MyHomePage(title: "my app")
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    MenuPage(),
    CartPage(),
    HistoryPage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history_edu),
            label: 'History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_box),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}

