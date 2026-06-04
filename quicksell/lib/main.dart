import 'screens/demo_chat_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'screens/login_screen.dart';
import 'screens/home_screen.dart';
import 'screens/register_screen.dart';
import 'screens/add_product_screen.dart';
import 'screens/chat_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyCIfntV89kJq4GdZaLK8fbafmBD8D7f7zs',
      appId: '1:4127723423:android:dbeea9ccf9830534d1b7aa',
      messagingSenderId: '4127723423',
      projectId: 'quicksell-231fd',
      storageBucket: 'quicksell-231fd.firebasestorage.app',
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QuickSell',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.orange),
        useMaterial3: true,
      ),
      home: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(child: CircularProgressIndicator()),
            );
          }
          if (snapshot.hasData) {
            return const HomeScreen();
          }
          return const LoginScreen();
        },
      ),
      routes: {
        '/register': (context) => const RegisterScreen(),
        '/add-product': (context) => const AddProductScreen(),
        '/chat': (context) => const ChatScreen(),
        '/demo-chat': (context) => const DemoChatScreen(),
      },
    );
  }
}
