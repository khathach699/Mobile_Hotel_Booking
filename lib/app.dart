import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/core/themes/app_themes.dart';
import 'package:hotel_booking/presentation/blocs/counter/counter_bloc.dart';
import 'package:hotel_booking/presentation/screens/auth/sign_in.dart';
import 'package:hotel_booking/routes/app_route.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 779),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Booking App',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: ThemeMode.system,
          routes: AppRoute.routes,
          home: BlocProvider(
            create: (context) => CounterBloc(),
            child: const SignInScreen(),
          ),
        );
      },
    );
  }
}
