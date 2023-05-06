import 'dart:io';

import 'package:bloc_bank_sha/blocs/auth/auth_bloc.dart';
import 'package:bloc_bank_sha/blocs/user/user_bloc.dart';
import 'package:bloc_bank_sha/shared/theme.dart';
import 'package:bloc_bank_sha/ui/pages/data_package_page.dart';
import 'package:bloc_bank_sha/ui/pages/data_provider_page.dart';
import 'package:bloc_bank_sha/ui/pages/data_success_page.dart';
import 'package:bloc_bank_sha/ui/pages/home_page.dart';
import 'package:bloc_bank_sha/ui/pages/onboarding_page.dart';
import 'package:bloc_bank_sha/ui/pages/pin_page.dart';
import 'package:bloc_bank_sha/ui/pages/profile_edit_page.dart';
import 'package:bloc_bank_sha/ui/pages/profile_edit_pin_page.dart';
import 'package:bloc_bank_sha/ui/pages/profile_edit_success_page.dart';
import 'package:bloc_bank_sha/ui/pages/profile_page.dart';
import 'package:bloc_bank_sha/ui/pages/sign_in_page.dart';
import 'package:bloc_bank_sha/ui/pages/sign_up_page.dart';
import 'package:bloc_bank_sha/ui/pages/sign_up_set_ktp_page.dart';
import 'package:bloc_bank_sha/ui/pages/sign_up_set_profile_page.dart';
import 'package:bloc_bank_sha/ui/pages/sign_up_success_page.dart';
import 'package:bloc_bank_sha/ui/pages/splash_page.dart';
import 'package:bloc_bank_sha/ui/pages/topup_amount_page.dart';
import 'package:bloc_bank_sha/ui/pages/topup_page.dart';
import 'package:bloc_bank_sha/ui/pages/topup_success.dart';
import 'package:bloc_bank_sha/ui/pages/tranfer_success_page.dart';
import 'package:bloc_bank_sha/ui/pages/transfer_amount_page.dart';
import 'package:bloc_bank_sha/ui/pages/transfer_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  HttpOverrides.global = new MyHttpOverrides();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthBloc()..add(AuthGetCurrentUser()),
        ),
        BlocProvider(
          create: (context) => UserBloc(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: lightBackgroundColor,
          appBarTheme: AppBarTheme(
            backgroundColor: lightBackgroundColor,
            centerTitle: true,
            elevation: 0,
            titleTextStyle: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: semiBold,
            ),
            iconTheme: IconThemeData(
              color: blackColor,
            ),
          ),
        ),
        debugShowCheckedModeBanner: false,
        routes: {
          // Route / => SplashScreen
          '/': (context) => const SplashPage(),
          '/onboarding': (context) => const OnboardingPage(),
          '/sign-in': (context) => const SignInPage(),
          '/sign-up': (context) => const SignUpPage(),
          '/sign-up-success': (context) => const SignUpSuccessPage(),
          '/home': (context) => const HomePage(),
          '/profile': (context) => const ProfilePage(),
          '/pin': (context) => const PinPage(),
          '/profile-edit': (context) => const ProfileEditPage(),
          '/profile-edit-pin': (context) => const ProfileEditPinPage(),
          '/profile-edit-success': (context) => const ProfileEditSuccessPage(),
          '/topup': (context) => const TopupPage(),
          '/topup-success': (context) => const TopupSuccessPage(),
          '/transfer': (context) => const TransferPage(),
          '/transfer-success': (context) => const TransferSuccessPage(),
          '/data-provider': (context) => const DataProviderPage(),
          '/data-success': (context) => const DataSuccessPage(),
        },
      ),
    );
  }
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
