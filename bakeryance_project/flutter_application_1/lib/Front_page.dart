import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Colors.pinkAccent,
        useMaterial3: false,
        fontFamily: 'Poppins',
      ),
      debugShowCheckedModeBanner: false,
      home: const HomeActivity(),
    );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {
  int _currentIndex = 0;

  final List<Widget> _pages = const [
    Center(
      child: Text(
        "Welcome to Bakeryance 🍰",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        "Your Orders 🛒",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
    Center(
      child: Text(
        "Settings ⚙️",
        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
      ),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        elevation: 10,
        backgroundColor: const Color.fromARGB(255, 218, 63, 115),
        shadowColor: Colors.pinkAccent.withOpacity(0.5),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(25)),
        ),
        titleSpacing: 0,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(Icons.cake_rounded, color: Colors.white, size: 28),
            SizedBox(width: 10),
            Text(
              "Bakeryance",
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w600,
                color: Colors.white,
                letterSpacing: 1,
              ),
            ),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundColor: const Color.fromARGB(
                255,
                211,
                2,
                152,
              ).withOpacity(0.3),
              child: IconButton(
                icon: const Icon(Icons.notifications, color: Colors.white),
                onPressed: () {},
              ),
            ),
          ),
        ],
      ),

      // Body content changes per tab
      body: _pages[_currentIndex],

      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: const Color.fromARGB(255, 240, 237, 237),
        unselectedItemColor: const Color.fromARGB(255, 236, 212, 212),
        backgroundColor: const Color.fromARGB(243, 233, 61, 129),
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag_rounded),
            label: 'Orders',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_rounded),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
