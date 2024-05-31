// import 'package:flutter/material.dart';
// import 'package:uyishi_31_05/views/widgets/custom_drawer.dart';

// class HomeScreen extends StatelessWidget {
//   final ValueChanged<bool> onThemeModeChanged;

//   const HomeScreen({
//     super.key,
//     required this.onThemeModeChanged,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Bosh Sahifa"),
//       ),
//       drawer: CustomDrawer(
//         onThemeModeChanged: onThemeModeChanged,
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:uyishi_31_05/controllers/settings_controller.dart';
import 'package:uyishi_31_05/views/screens/setting_screen.dart';

class HomePage extends StatelessWidget {
  final SettingsController settingsController;

  HomePage(this.settingsController);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: settingsController.appBarColor,
        title: Text('Bosh Sahifa'),
        actions: [
          IconButton(
            icon: Icon(Icons.chevron_right_rounded),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: settingsController.appBarColor,
              ),
              child: Text('Menyu'),
            ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Bosh Sahifa'),
              trailing: Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Sozlamalar'),
              trailing: Icon(Icons.chevron_right_rounded),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => SettingsPage(settingsController)),
                );
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: settingsController.appBarColor,
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Assalomu\nAlaykum',
                    style: TextStyle(
                      fontSize: 80,
                      color: settingsController.bodyTextColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
