import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:vukoje_mma/pages/media_page.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  MobileAds.instance.initialize();
  runApp(const VukojeMMAApp());
}

class VukojeMMAApp extends StatelessWidget {
  const VukojeMMAApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      initialRoute: MediaPage.id,
      routes: {
        MediaPage.id: (context) => const MediaPage(),
      },
    );
  }
}
