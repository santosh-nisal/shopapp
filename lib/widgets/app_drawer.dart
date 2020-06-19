import 'package:flutter/material.dart';

import '../screens/orders_screen.dart';
import '../screens/user_products_screen.dart';

class AppDrawer extends StatelessWidget {

  Widget buildDrawerItem(
    BuildContext ctx,
    Icon itemIcon,
    String title,
    String routeName,
  ) {
    return ListTile(
      leading: itemIcon,
      title: Text(title),
      onTap: () {
        Navigator.of(ctx).pushReplacementNamed(routeName);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Hello Friend'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          buildDrawerItem(
            context,
            Icon(Icons.shop),
            'Shop',
            '/',
          ),
          buildDrawerItem(
            context,
            Icon(Icons.payment),
            'Orders',
            OrdersScreen.routeName,
          ),
          buildDrawerItem(
            context,
            Icon(Icons.edit),
            'Manage Products',
            UserProductsScreen.routeName,
          )
        ],
      ),
    );
  }
}
