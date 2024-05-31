import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/activities/screens/calendar_activity.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/screens/event_regitration/event_registration.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/screens/home/home.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/screens/widgets/home_drawer.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/colors.dart';
import 'package:flutter_ucc_welfare_project/utils/constants/text_strings.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

class BaseScreen extends StatefulWidget {
  const BaseScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<BaseScreen> {
  int _selectedIndex = 0;

  final List<Map<String, dynamic>> _navigationItems = [
    {
      'icon': Icons.home,
      'label': AppText.navigationHome,
      'widget': const HomeScreem(),
    },
    {
      'icon': Icons.calendar_month,
      'label': AppText.navigationEvent,
      'widget': const CalendarActivity(),
    },
    {
      'icon': Icons.person,
      'label': AppText.navigationNotification,
      'widget': const EventRegistration(),
    },
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondary,
        title: Text(_navigationItems[_selectedIndex]['label']),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(25),
              bottomLeft: Radius.circular(25)),
        ),
        actions: <Widget>[
          Builder(
            builder: (context) {
              return IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Scaffold.of(context).openEndDrawer();
                },
              );
            },
          ),
        ],
      ),

      endDrawer: const HomeDrawer(),

      body: _navigationItems[_selectedIndex]['widget'],
      bottomNavigationBar: BottomNavigationBar(
        items: _navigationItems
            .map((item) => BottomNavigationBarItem(
                  icon: Icon(item['icon']),
                  label: item['label'],
                ))
            .toList(),
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.secondary,
        onTap: _onItemTapped,
      ),
    );
  }
}
