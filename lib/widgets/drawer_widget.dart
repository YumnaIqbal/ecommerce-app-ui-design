import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final imageUrl =
        'https://images.unsplash.com/photo-1570295999919-56ceb5ecca61?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=580&q=80';
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.teal.shade400,
        ),
        child: ListView(
          children: [
            //*Header
            DrawerHeader(
              padding: EdgeInsets.zero,
              child: UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                ),
                margin: EdgeInsets.zero,
                accountName: Text('Yumna Iqbal'),
                accountEmail: Text('Yumnai666@gmail.com'),
                currentAccountPicture: CircleAvatar(
                  backgroundImage: NetworkImage(imageUrl),
                ),
              ),
            ),

            //*home
            ListTile(
              onTap: () {
                Navigator.pushNamed(context, '/home');
              },
              leading: Icon(
                Icons.home_outlined,
                color: Colors.white,
              ),
              title: Text(
                'Home',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            //*profile
            ListTile(
              leading: Icon(
                Icons.person_pin,
                color: Colors.white,
              ),
              title: Text(
                'Profile',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            //*contact
            ListTile(
              leading: Icon(
                Icons.contact_mail,
                color: Colors.white,
              ),
              title: Text(
                'Contact Us',
                textScaleFactor: 1.2,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),

            Divider(),

            //logout
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
              ),
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                leading: Icon(
                  Icons.outbond_outlined,
                  color: Colors.teal,
                ),
                title: Text(
                  'Logout',
                  textScaleFactor: 1.2,
                  style: TextStyle(
                    color: Colors.teal,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
