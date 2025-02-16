import 'package:flutter/material.dart';
import '../screens/profile_screen.dart';
import '../screens/settings_screen.dart';
import '../screens/exercise_history_screen.dart';

class CustomDrawer extends StatelessWidget {
  final bool isDarkMode;
  final VoidCallback toggleTheme;

  const CustomDrawer({
    required this.isDarkMode,
    required this.toggleTheme,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, size: 50),
            ),
            accountName: const Text('المستخدم'),
            accountEmail: const Text('user@example.com'),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade700, Colors.blue.shade900],
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildAnimatedListTile(
                  icon: Icons.home,
                  title: 'الصفحة الرئيسية',
                  onTap: () => Navigator.pop(context),
                ),
                _buildAnimatedListTile(
                  icon: Icons.person,
                  title: 'الملف الشخصي',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ProfileScreen(),
                      ),
                    );
                  },
                ),
                _buildAnimatedListTile(
                  icon: Icons.settings,
                  title: 'الإعدادات',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SettingsScreen(
                          isDarkMode: isDarkMode,
                          toggleTheme: toggleTheme,
                        ),
                      ),
                    );
                  },
                ),
                _buildAnimatedListTile(
                  icon: Icons.history,
                  title: 'سجل التمارين',
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExerciseHistoryScreen(),
                      ),
                    );
                  },
                ),
                _buildAnimatedListTile(
                  icon: Icons.star,
                  title: 'المفضلة',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnimatedListTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 300),
      builder: (context, double value, child) {
        return Transform.translate(
          offset: Offset(-30 * (1 - value), 0),
          child: Opacity(
            opacity: value,
            child: ListTile(
              leading: Icon(icon),
              title: Text(title),
              onTap: onTap,
            ),
          ),
        );
      },
    );
  }
}
