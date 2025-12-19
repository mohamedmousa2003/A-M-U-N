import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:amun/core/utils/app_colors.dart';
import '../../core/utils/app_text_style.dart';
import '../home/presentation/pages/home_view.dart';
import '../trip/presentation/pages/trip_screen.dart';

class MainBottomNavBar extends StatefulWidget {
  const MainBottomNavBar({super.key});
  static const String routeName = "MainBottomNavBar";

  @override
  State<MainBottomNavBar> createState() => _MainBottomNavBarState();
}

class _MainBottomNavBarState extends State<MainBottomNavBar> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    const HomeView(),
    // const TripScreen(),
    const FavoritesScreen(),
    const FavoritesScreen(),
    const ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: AppColor.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 10,
            ),
          ],
          borderRadius: BorderRadius.vertical(top: Radius.circular(20.r)),
        ),
        child: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: _onTap,
          type: BottomNavigationBarType.fixed,
          backgroundColor: AppColor.lightGray,
          selectedItemColor: AppColor.white,
          unselectedItemColor: AppColor.white,
          selectedLabelStyle: AppTextStyle.size14.copyWith(fontWeight: FontWeight.bold),
          unselectedLabelStyle: AppTextStyle.size12.copyWith(fontWeight: FontWeight.normal),
          showUnselectedLabels: false,

          elevation: 0,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined, size: 28.sp),
              activeIcon: Icon(Icons.home, color: AppColor.backgroundColor, size: 28.sp),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.airline_stops_outlined, size: 28.sp),
              activeIcon: Icon(Icons.airline_stops_outlined, color: AppColor.backgroundColor, size: 28.sp),
              label: "AI",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.favorite_border, size: 28.sp),
              activeIcon: Icon(Icons.favorite, color: AppColor.backgroundColor, size: 28.sp),
              label: "Favorites",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline, size: 28.sp),
              activeIcon: Icon(Icons.person, color: AppColor.backgroundColor, size: 28.sp),
              label: "Profile",
            ),

          ],
        ),
      ),
    );
  }
}

// Placeholder Screens
class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Text("Favorites", style: AppTextStyle.size20),
  );
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) => Center(
    child: Text("Profile", style: AppTextStyle.size20),
  );
}
