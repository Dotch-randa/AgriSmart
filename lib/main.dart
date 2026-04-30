// import 'package:app_3ouchba/Screens/AuthScreen.dart';
// import 'package:app_3ouchba/Screens/MapPage.dart';
// import 'package:app_3ouchba/Screens/chatBotPage.dart';
// import 'package:app_3ouchba/Screens/diagnosticpage.dart';
// import 'package:app_3ouchba/Screens/homeScreen.dart';
// import 'package:app_3ouchba/Screens/onboarding_page.dart';
// import 'package:provider/provider.dart';
// import 'package:supabase_flutter/supabase_flutter.dart';// يُنشأ تلقائياً بـ flutterfire configure

// import 'package:flutter/material.dart';



// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
  
//   await Supabase.initialize(
//     url: 'https://ogimlyaxpyssftugnzyx.supabase.co',       // ton Project URL
//     anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Im9naW1seWF4cHlzc2Z0dWduenl4Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3Nzc0ODA4MjYsImV4cCI6MjA5MzA1NjgyNn0.ox4smxhjRI8qXUit4TqcZwLGSPwoAHzmSW4fyDFC06w',             // ta clé anon
//   );
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
 
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (_) => DiagnosticProvider()),
//         // Add other providers here if you have more
//       ],
//       child: MaterialApp(
//         title: '3ouchba - معلومة فلاح',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(
//           primarySwatch: Colors.green,
//           fontFamily: 'Poppins',
//         ),
//         initialRoute: '/',
//         routes: {
//           '/': (context) => const OnboardingPage(),
//           '/auth': (context) => const AuthScreen(),
//           '/home': (context) => const HomeScreen(),
//           '/map': (context) => const MapPage(),
//           '/chat': (context) => const ChatbotPage(),
//           '/diagnostic': (context) => const DiagnosticScreen(),
//         },
//       ),
//     );
//   }
// }


import 'package:app_3ouchba/Services/ConnectivityService.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:app_3ouchba/Screens/AuthScreen.dart';
import 'package:app_3ouchba/Screens/MapPage.dart';
import 'package:app_3ouchba/Screens/chatBotPage.dart';
import 'package:app_3ouchba/Screens/diagnosticpage.dart';
import 'package:app_3ouchba/Screens/homeScreen.dart';
import 'package:app_3ouchba/Screens/onboarding_page.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // init internet checker
  await ConnectivityService.init();

  // init supabase
  await Supabase.initialize(
    url: 'https://ogimlyaxpyssftugnzyx.supabase.co',
    anonKey: 'YOUR_ANON_KEY',
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => DiagnosticProvider()),
      ],
      child: MaterialApp(
        title: '3ouchba - معلومة فلاح',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.green,
          fontFamily: 'Poppins',
        ),

        // 👇 هذا هو المكان الصحيح للـ OfflineBanner
        builder: (context, child) {
          return Column(
            children: [
              const OfflineBanner(),
              Expanded(child: child!),
            ],
          );
        },

        initialRoute: '/',
        routes: {
          '/': (context) => const OnboardingPage(),
          '/auth': (context) => const AuthScreen(),
          '/home': (context) => const HomeScreen(),
          '/map': (context) => const MapPage(),
          '/chat': (context) => const ChatbotPage(),
          '/diagnostic': (context) => const DiagnosticScreen(),
        },
      ),
    );
  }
}