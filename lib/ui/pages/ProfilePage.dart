import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Профиль'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'Ваш профиль',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}