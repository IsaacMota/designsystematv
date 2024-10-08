import 'package:flutter/material.dart';
import 'package:flutter_application_1/DesignSystem/Components/BottomTabBar/bottom_tab_bar.dart';
import 'package:flutter_application_1/DesignSystem/Components/BottomTabBar/bottom_tab_bar_view_model.dart';
import 'package:flutter_application_1/DesignSystem/shared/colors.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int actualIndex = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        backgroundColor: lightTertiaryBaseColorLight,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 40),
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundImage:
                      AssetImage('assets/profile_pic.jpg'), // Imagem de perfil
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Amanda Doe',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('amanda@gmail.com'),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text('Edit Name'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Shipping Info'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Notification'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            ListTile(
              title: const Text('Terms & Condition'),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
            const SizedBox(height: 20),
            ListTile(
              title: const Text(
                'Logout',
                style: TextStyle(color: Colors.red),
              ),
              onTap: () {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabBar.instantiate(
        viewModel: BottomTabBarViewModel(
          bottomTabs: [
            const BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Home",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: "Messages",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.label),
              label: "Label",
            ),
            const BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: "Profile",
            )
          ],
          onIndexChanged: (index) {
            setState(() {
              actualIndex = index;
            });
          },
        ),
        currentIndex: actualIndex,
      ),
    );
  }
}
