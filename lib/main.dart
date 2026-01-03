import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'list_page.dart';
import 'form_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const ListPage(),
        '/form': (context) {
          final arg = ModalRoute.of(context)?.settings.arguments;
          return FormPage(user: arg as Map<String, dynamic>?);
        },
      },
    );
  }
}
