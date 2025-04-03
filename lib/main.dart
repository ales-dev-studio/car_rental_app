import 'package:car_rental_app/core/gen/fonts.gen.dart';
import 'package:car_rental_app/core/theme/colors.dart';
import 'package:car_rental_app/features/home_feature/presentation/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Car rental app',
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: AppColors.primaryColor,
          brightness: Brightness.dark,
        ),
        fontFamily: FontFamily.poppinsRegular,
        useMaterial3: true,
        scaffoldBackgroundColor: AppColors.backgroundColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.backgroundColor,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontSize: 20.0,
          ),
        ),
        bottomSheetTheme: const BottomSheetThemeData(
          backgroundColor: AppColors.backgroundColor,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
