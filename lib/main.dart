import 'package:flutter/material.dart';
import 'package:public_transport_app/constants.dart';
import 'package:public_transport_app/screens/login_screen.dart';
import 'package:public_transport_app/screens/home_screen.dart';
import 'package:public_transport_app/screens/map_screen.dart';
import 'package:public_transport_app/screens/profile_screen.dart';

void main() => runApp(MaterialApp(
  home: SplashScreen(), // Set SplashScreen as the initial screen
  debugShowCheckedModeBanner: false,
  theme: ThemeData(fontFamily: 'OpenSans'),
));

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  int _currentIndex = 0;

  final List<Widget> _screens = [Home(), Profile(), MyMap()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMoonStones,
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        backgroundColor: Colors.white,
        selectedFontSize: 0,
        elevation: 0.0,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _currentIndex == 0
                ? Image.asset('assets/icons/home_colored.png', width: 25)
                : Image.asset('assets/icons/home.png', width: 25),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 1
                ? Image.asset('assets/icons/profile_colored.png', width: 20)
                : Image.asset('assets/icons/profile.png', width: 20),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: _currentIndex == 2
                ? Image.asset('assets/icons/map_colored.png', width: 20)
                : Image.asset('assets/icons/map.png', width: 20),
            label: '',
          ),
        ],
      ),
    );
  }
}

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate loading time and navigate to the Login screen
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Login()), // Navigate to Login
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Transport logo
            Image.asset(
              'assets/images/png-clipart-bus-rapid-transit-sydney-train-transport-bus-blue-logo.png', // Path to your logo
              width: 200,
              height: 200,
            ),
            SizedBox(height: 20),
            // App name
            Text(
              'Public Transport App',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 40),
            // Loading spinner
            CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}
