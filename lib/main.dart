import 'package:flutter/material.dart';
import 'package:kisan_bazaar/Login_pages/Intro_page.dart';
import 'package:kisan_bazaar/Login_pages/sign_up_page.dart';
import 'package:kisan_bazaar/home_page.dart';
import 'package:kisan_bazaar/providers/user_provider.dart';
import 'package:kisan_bazaar/services/auth_service.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
    )
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AuthService authService = AuthService();

  @override
  void initState() {
    super.initState();
    authService.getUserData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Kisan Bazaar',
      theme: ThemeData(
        //  primarySwatch: Colors.green,
        fontFamily: "Lato",
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green, // this if for building stuffs for me

          primary: const Color.fromRGBO(20, 208, 42, 1.0),
        ),

        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
          ),
          titleMedium: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          titleSmall: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: Provider.of<UserProvider>(context).user.token.isNotEmpty
          ? const HomePage()
          : const SignUpPage(),
          
    );
  }
}
