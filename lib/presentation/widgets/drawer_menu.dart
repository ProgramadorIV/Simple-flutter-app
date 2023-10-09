import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_flutter_app/config/menu/menu_item.dart';

class DrawerMenu extends StatefulWidget {
  const DrawerMenu({super.key, required this.scaffoldKey});

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  State<DrawerMenu> createState() => _DrawerMenuState();
}

class _DrawerMenuState extends State<DrawerMenu> {
  int menuIndex = 0;

  @override
  Widget build(BuildContext context) {
    final hasNotch = MediaQuery.of(context).viewPadding.top > 35;

    return NavigationDrawer(
      selectedIndex: menuIndex,
      onDestinationSelected: (value) {
        setState(() {
          menuIndex = value;
        });

        final menuItem = appMenuItems[value];
        context.push(menuItem.link);
        widget.scaffoldKey.currentState?.closeDrawer();
      },
      children: [
        //*En una app prof. sería mejor mandar al widget la lista de opciones
        //del menú en el constructor para así reusarlo en distintos drawers
        Padding(
          padding: EdgeInsets.fromLTRB(20, hasNotch ? 0 : 20, 20, 20),
          child: const Text('Menu options'),
        ),
        ...appMenuItems.sublist(0, 4).map(
              (e) => NavigationDrawerDestination(
                icon: Icon(e.icon),
                label: Text(e.title),
              ),
            ),
        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Divider(),
        ),

        const Padding(
          padding: EdgeInsets.fromLTRB(30, 10, 30, 10),
          child: Text('Other options'),
        ),
        ...appMenuItems.sublist(4).map(
              (e) => NavigationDrawerDestination(
                icon: Icon(e.icon),
                label: Text(e.title),
              ),
            ),
      ],
    );
  }
}
