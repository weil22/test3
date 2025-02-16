import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('الملف الشخصي'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const CircleAvatar(
            radius: 50,
            child: Icon(Icons.person, size: 50),
          ),
          const SizedBox(height: 16),
          ListTile(
            leading: const Icon(Icons.person_outline),
            title: const Text('الاسم'),
            subtitle: const Text('المستخدم'),
          ),
          ListTile(
            leading: const Icon(Icons.email_outlined),
            title: const Text('البريد الإلكتروني'),
            subtitle: const Text('user@example.com'),
          ),
        ],
      ),
    );
  }
}
