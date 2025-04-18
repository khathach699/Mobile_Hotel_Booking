import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hotel_booking/presentation/blocs/counter/counter_bloc.dart';
import 'package:hotel_booking/presentation/screens/home/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690), // Kích thước thiết kế chuẩn
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          title: 'My App',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: TextTheme(bodyMedium: TextStyle(fontSize: 16.sp)),
          ),
          home: BlocProvider(
            create: (context) => CounterBloc(),
            child: const HomeScreen(),
          ),
        );
      },
    );
  }
}
