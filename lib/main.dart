import 'dart:io';

import 'package:coffee_house/di/ServiceLocator.dart';
import 'package:coffee_house/ui/pages/CartPage.dart';
import 'package:coffee_house/ui/pages/HistoryPage.dart';
import 'package:coffee_house/ui/pages/MenuPage.dart';
import 'package:coffee_house/ui/pages/OrderStatusPage.dart';
import 'package:coffee_house/ui/pages/ProductInfo.dart';
import 'package:coffee_house/ui/pages/ProfilePage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(
      ProviderScope(
          child: MaterialApp(
            initialRoute: '/menu',
            routes: {
              '/menu': (context) => MyHomePage(title: 'Product App'),
              '/menu/info': (context) => ProductInfoPage(),
              '/order/status': (context) => OrderStatusPage(coffeeIds: [],),
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
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 24,
              height: 24,
              color: _currentIndex == 0
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/cart.svg',
              width: 24,
              height: 24,
              color: _currentIndex == 1
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/history.svg',
              width: 24,
              height: 24,
              color: _currentIndex == 2
                  ? Theme.of(context).primaryColor
                  : Colors.grey,
            ),
            label: 'History',
          ),
        ],
      ),
    );
  }
}

