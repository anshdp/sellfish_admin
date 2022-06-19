import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sellfish/admin_dashboard/admin_dashboard.dart';
import 'package:sellfish/home/home.dart';
import 'package:sellfish/profile/admin_profile.dart';
import 'package:sellfish/router/app_constants.dart';
import 'package:sellfish/status/app_status.dart';
import 'package:sellfish/widgets/drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  late PageController _pageController;
  final ProfileBloc viewProfileBloc = ProfileBloc();

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => viewProfileBloc,
      child: BlocConsumer<ProfileBloc, ProfileState>(
        listener: (context, state) {
          if (state is LogoutSuccess) {
            Navigator.pushReplacementNamed(context, RouteConstants.loginRoute);
          }
        },
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text(
                'SellFish Admin',
              ),
            ),
            body: SafeArea(
              child: SizedBox.expand(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => _currentIndex = index);
                  },
                  children: <Widget>[
                    const AdminDashboard(),
                    Status(),
                    const Text('Done'),
                    Profile(),
                  ],
                ),
              ),
            ),
            bottomNavigationBar: BottomNavyBar(
              selectedIndex: _currentIndex,
              onItemSelected: (index) {
                setState(() => _currentIndex = index);
                _pageController.jumpToPage(index);
              },
              items: <BottomNavyBarItem>[
                BottomNavyBarItem(
                  activeColor: Colors.greenAccent,
                  inactiveColor: Colors.black,
                  title: const Text('Home'),
                  icon: const Icon(
                    Icons.home,
                    size: 26,
                  ),
                ),
                BottomNavyBarItem(
                  activeColor: Colors.greenAccent,
                  inactiveColor: Colors.black,
                  title: const Text('Dashboard'),
                  icon: const Icon(
                    Icons.dashboard_rounded,
                    size: 26,
                  ),
                ),
                BottomNavyBarItem(
                  activeColor: Colors.greenAccent,
                  inactiveColor: Colors.black,
                  title: const Text('Status'),
                  icon: const Icon(
                    Icons.bar_chart,
                    size: 26,
                  ),
                ),
                BottomNavyBarItem(
                  activeColor: Colors.greenAccent,
                  inactiveColor: Colors.black,
                  title: const Text('Profile'),
                  icon: const Icon(
                    Icons.people,
                    size: 26,
                  ),
                ),
              ],
            ),
            drawer: AdminDrawer(profileBloc: viewProfileBloc),
          );
        },
      ),
    );
  }
}
