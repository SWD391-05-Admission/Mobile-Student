import 'package:flutter/material.dart';
import './providers/user_controller.dart';
import './screens/book_detail_screen.dart';
import 'screens/counselor_detail_screen.dart';
import './screens/talkshow_detail_screen.dart';
import './widgets/consultant_item.dart';
import './widgets/talkshow_item.dart';
import './screens/login_screen.dart';
import '../providers/google_sign_in.dart';
import 'package:flutter/services.dart';
import '../screens/profile_screen.dart';
import '../screens/university_detail_screen.dart';
import '../screens/university_screen.dart';
import '../widgets/bottom_bar_widget.dart';
import 'package:provider/provider.dart';
import './screens/authen_screen.dart';
import './values/app_colors.dart';
import 'package:firebase_core/firebase_core.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: GoogleSignInProvider(),
        ),
        ChangeNotifierProvider.value(
          value: UserController(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch:
              AppColors.generateMaterialColor(AppColors.primaryColor),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: LoginPage.routeName,
        routes: {
          AuthenScreen.routeName: (context) => AuthenScreen(),
          LoginPage.routeName: (context) => const LoginPage(),
          BottomBar.routeName: (context) => const BottomBar(),
          ProfileScreen.routeName: (context) => const ProfileScreen(),
          UniversityScreen.routeName: (context) => const UniversityScreen(),
          UniversityDetailScreen.routeName: (context) =>
              const UniversityDetailScreen(),
          TalkshowDetailScreen.routeName: (context) => TalkshowDetailScreen(),
          ConsultantItem.routeName: (context) => const ConsultantItem(),
          ConsultantDetailScreen.routeName: (context) =>
              ConsultantDetailScreen(),
          TalkshowItem.routeName: (context) => const TalkshowItem(),
          BookDetailScreen.routeName: (context) => const BookDetailScreen(),
        },
      ),
    );
  }
}
