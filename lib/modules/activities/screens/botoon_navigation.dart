import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/activities/screens/calendar_activity.dart';

class BottonNavigation extends StatefulWidget {
  const BottonNavigation({super.key});

  @override
  _BottonNavigationState createState() => _BottonNavigationState();
}

List<IconData> navIcons = [
  Icons.home,
  Icons.wallet,
  Icons.person
];

List<String> navTitle = [
  'Home',
  'Wallet',
  'Person',
];

// int selectedIndex = 0;

class _BottonNavigationState extends State<BottonNavigation> {

  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Text('Home Page'),
    Text('Search Page'),
    Text('Profile Page'),
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
        title: const Text('Inicio'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      // appBar: AppBar(
      //   title: Text('Bottom Navigation'),
      // ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
        
      ),
      bottomNavigationBar: SafeArea(
        child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 65,
          margin: const EdgeInsets.only(
            right: 24, 
            left: 24, 
            bottom: 24
          ),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(20),
                blurRadius: 20,
                spreadRadius: 10
              ),
            ]
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: navIcons.map((icon) {
              int index = navIcons.indexOf(icon);
              bool isSelected = _selectedIndex == index;
              return Material(
                color: Colors.transparent,
                child: GestureDetector(
                  onTap: () {
                    _onItemTapped(index);
                    // setState(() {
                    //   selectedIndex = index;
                    //   print(index);
                    // });
                  },
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(
                            top: 15,
                            bottom: 0,
                            left: 35,
                            right: 35,
                          ),
                          child: Icon(
                            icon,
                            color: isSelected ? Colors.blue : Colors.grey,
                          ),
                        ),
                        Text(navTitle[index], 
                          style: TextStyle(
                            color: isSelected? Colors.blue : Colors.grey, 
                            fontSize: 12,
                          ),
                        )
                    
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
      ),
    );
  }
}

class MenuBtn extends StatelessWidget {
  const MenuBtn({
    super.key, required this.press,
  });

  final VoidCallback press;
  // final ValueChanged<Artboard> riveOnInit;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GestureDetector(
        onTap: press,
        child: Container(
          margin: EdgeInsets.only(left: 16),
          height: 40,
          width: 40,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0,3),
                blurRadius: 8,
              )
            ]
          ),
          child: const Icon(Icons.menu),
        ),
      ),
    );
  }
}