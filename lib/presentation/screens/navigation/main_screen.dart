import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hotel_booking/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:hotel_booking/presentation/blocs/navigation/navigation_event.dart';
import 'package:hotel_booking/presentation/blocs/navigation/navigation_state.dart';
import 'package:hotel_booking/presentation/screens/booking/my_booking.dart';
import 'package:hotel_booking/presentation/screens/home/home_screen.dart';
import 'package:hotel_booking/presentation/screens/message/message.dart';
import 'package:hotel_booking/presentation/screens/profile/profile.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  // Danh sách các màn hình tương ứng với từng tab
  static const List<Widget> _screens = <Widget>[
    HomeScreen(),
    MyBookingScreen(),
    MessageScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavigationBloc(),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: _screens[state.selectedIndex], // Hiển thị màn hình tương ứng
            bottomNavigationBar: BottomNavigationBar(
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home_outlined),
                  activeIcon: Icon(Icons.home_filled),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.book_outlined),
                  activeIcon: Icon(Icons.book),
                  label: 'My Booking',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.message_outlined),
                  activeIcon: Icon(Icons.message),
                  label: 'Message',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline),
                  activeIcon: Icon(Icons.person),
                  label: 'Profile',
                ),
              ],
              currentIndex: state.selectedIndex,
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              selectedLabelStyle: const TextStyle(fontWeight: FontWeight.w600),
              unselectedLabelStyle: const TextStyle(
                fontWeight: FontWeight.w400,
              ),
              showUnselectedLabels: true,
              onTap: (index) {
                // Phát sự kiện ChangeTabEvent khi nhấn tab
                context.read<NavigationBloc>().add(ChangeTabEvent(index));
              },
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              elevation: 10,
            ),
          );
        },
      ),
    );
  }
}
