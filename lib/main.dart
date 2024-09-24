import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_login_provider/firebase_options.dart';
import 'package:task_login_provider/ui/screens/me_screen.dart';
import 'package:task_login_provider/ui/screens/signup_screen.dart';

import 'providers/auth_provider.dart';
import 'ui/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
      ], child: const MyApp()),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'Kakas Group App',
      initialRoute: '/logIn',
      routes: {
        '/logIn': (context) => const LogInScreen(),
        '/signUp': (context) => const SignUpScreen(),
        '/meScreen': (context) => const MeScreen(),
      },
    );
  }
}
