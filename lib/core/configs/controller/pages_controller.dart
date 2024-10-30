import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jisr/core/configs/controller/ButtomNavBar.dart';
import 'package:jisr/core/configs/theme/app_colors.dart';
import '../../../presentation/history/pages/history.dart';
import '../../../presentation/orders/pages/orders.dart';
import '../../../presentation/settings/pages/settings.dart';

class PagesController extends StatelessWidget {
  final PageController _pageController = PageController(initialPage: 1); // Set initialPage to 1

  PagesController({super.key});

  void _onItemTapped(BuildContext context, int index) {
    context.read<BottomNavCubit>().changePage(index);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocBuilder<BottomNavCubit, int>(
          builder: (context, state) {
            return PageView(
              controller: _pageController,
              onPageChanged: (index) {
                context.read<BottomNavCubit>().changePage(index);
              },
              children: const [
                HistoryPage(),
                OrdersPage(),
                SettingsPage()
              ],
            );
          },
        ),
        bottomNavigationBar: BlocBuilder<BottomNavCubit, int>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: Container(
                decoration: BoxDecoration(
                  color: AppColors.darkBackground.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: BottomNavigationBar(
                  currentIndex: state,
                  onTap: (index) => _onItemTapped(context, index),
                  backgroundColor: Colors.transparent,
                  elevation: 7,
                  selectedFontSize: 14,
                  unselectedFontSize: 14,
                  selectedItemColor: AppColors.primary,
                  unselectedItemColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  items: [
                    _buildBottomNavigationBarItem(
                      icon: Icons.history,
                      label: 'History',
                      isSelected: state == 0,
                    ),
                    _buildBottomNavigationBarItem(
                      icon: Icons.swap_vert,
                      label: 'Orders',
                      isSelected: state == 1,
                    ),
                    _buildBottomNavigationBarItem(
                      icon: Icons.settings,
                      label: 'Settings',
                      isSelected: state == 2,
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  BottomNavigationBarItem _buildBottomNavigationBarItem({
    required IconData icon,
    required String label,
    required bool isSelected,
  }) {
    return BottomNavigationBarItem(
      icon: Column(
        children: [
          Icon(icon, color: isSelected ? AppColors.primary : Colors.white),
          if (isSelected)
            Column(
              children: [
                Text(
                  label,
                  style: TextStyle(
                    color: isSelected ? AppColors.primary : Colors.white,
                  ),
                ),
                Image.asset(
                  'assets/images/selected_item.png',
                  width: 50,
                ),
              ],
            ),
        ],
      ),
      label: '',
    );
  }
}
