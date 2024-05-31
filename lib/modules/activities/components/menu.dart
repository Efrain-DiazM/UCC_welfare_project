// import 'package:flutter/material.dart';

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

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;

//   // Lista de opciones de navegación
//   final List<Map<String, dynamic>> _navigationItems = [
//     {
//       'icon': Icons.home,
//       'label': 'Inicio',
//       'widget': Center(child: Text('Home Page')),
//     },
//     {
//       'icon': Icons.search,
//       'label': 'Buscar',
//       'widget': Center(child: Text('Search Page')),
//     },
//     {
//       'icon': Icons.person,
//       'label': 'Perfil',
//       'widget': Center(child: Text('Profile Page')),
//     },
//     // Puedes agregar más elementos aquí
//   ];

//   // Lista de opciones del Drawer
//   final List<Map<String, dynamic>> _drawerItems = [
//     {
//       'icon': Icons.settings,
//       'label': 'Configuraciones',
//       'onTap': () {
//         // Acción para Configuraciones
//       },
//     },
//     {
//       'icon': Icons.help,
//       'label': 'Ayuda',
//       'onTap': () {
//         // Acción para Ayuda
//       },
//     },
//     // Puedes agregar más elementos aquí
//   ];

//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Inicio'),
//         actions: <Widget>[
//           Builder(
//             builder: (context) {
//               return IconButton(
//                 icon: Icon(Icons.more_vert),
//                 onPressed: () {
//                   Scaffold.of(context).openEndDrawer();
//                 },
//               );
//             },
//           ),
//         ],
//       ),
//       endDrawer: Drawer(
//         child: ListView(
//           padding: EdgeInsets.zero,
//           children: <Widget>[
//             DrawerHeader(
//               child: Text('Opciones'),
//               decoration: BoxDecoration(
//                 color: Colors.blue,
//               ),
//             ),
//             ..._drawerItems.map((item) => ListTile(
//                   leading: Icon(item['icon']),
//                   title: Text(item['label']),
//                   onTap: () {
//                     item['onTap']();
//                     Navigator.pop(context);
//                   },
//                 )),
//           ],
//         ),
//       ),
//       body: _navigationItems[_selectedIndex]['widget'],
//       bottomNavigationBar: BottomNavigationBar(
//         items: _navigationItems
//             .map((item) => BottomNavigationBarItem(
//                   icon: Icon(item['icon']),
//                   label: item['label'],
//                 ))
//             .toList(),
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.blue,
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
