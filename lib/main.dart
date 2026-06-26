import 'package:admin_pannel/screens/Mainlayout.dart';
import 'package:admin_pannel/screens/Menupage.dart';
import 'package:admin_pannel/screens/analyticspage.dart';
import 'package:admin_pannel/screens/dashboard.dart';
import 'package:admin_pannel/screens/orders_history.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        //name: "com.example.ecommerece",
        options: const FirebaseOptions(
            apiKey: "AIzaSyBA9QIPopUhvnNS1tSRRhkNe-mwTxPDYdk",
            authDomain: "flutter-notifcation.firebaseapp.com",
            projectId: "flutter-notifcation",
            storageBucket: "flutter-notifcation.appspot.com",
            messagingSenderId: "666982532056",
            appId: "1:666982532056:web:10f8b1a38da70803f4e8ad",
            measurementId: "G-YCD9J4HLNY"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const GoMealApp());
}

class GoMealApp extends StatelessWidget {
  const GoMealApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainLayout(),
    );
  }
}

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;

  final pages = [
    const DashboardPage(),
    const Orderhistorypage(),
    const AnalyticsDashboard(),
    const MenuPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
    );
  }
}
