import 'package:flutter/material.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/controllers/change_language.dart';
import 'package:flutter_ucc_welfare_project/modules/aplication/screens/widgets/info_card.dart';
import 'package:flutter_ucc_welfare_project/modules/authentication/controllers/logout.dart';
import 'package:get/get.dart';

class HomeDrawer extends StatefulWidget {
  const HomeDrawer({super.key});

  @override
  State<HomeDrawer> createState() => _HomeDrawerState();
}

class _HomeDrawerState extends State<HomeDrawer> {
  final List<Map<String, dynamic>> _drawerItems = [
    {
      'icon': Icons.settings,
      'label': 'Configuraciones',
      'onTap': () {
      },
    },
    {
      'icon': Icons.help,
      'label': 'Ayuda',
      'onTap': () {
      },
    },
    {
      'icon': Icons.exit_to_app,
      'label': 'Cerrar Sesión',
      'onTap': () {
        AuthController.to.logout(); 
      },
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ChangeLanguageController changeLanguageController = Get.put(ChangeLanguageController());
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: InfoCard(name: "Efrain", profession: "Ingeniero"),
          ),
          ..._drawerItems.map((item) => ListTile(
                leading: Icon(item['icon']),
                title: Text(item['label']),
                onTap: () {
                  item['onTap']();
                  Navigator.pop(context);
                },
              )),
        ],
      ),
    );
  }
}
