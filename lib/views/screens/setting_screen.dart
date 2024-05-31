import 'package:flutter/material.dart';
import 'package:uyishi_31_05/controllers/settings_controller.dart';
import 'package:uyishi_31_05/model/setting_model.dart';
import 'package:uyishi_31_05/views/screens/home_screen.dart';
import 'package:uyishi_31_05/views/widgets/custom_drawer.dart';
import 'package:uyishi_31_05/utils/app_constants.dart';

class SettingsPage extends StatefulWidget {
  final SettingsController settingsController;

  SettingsPage(this.settingsController);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late bool _isDarkMode;
  late Color _appBarColor;
  // late double _bodyTextSize;
  late Color _bodyTextColor;
  late String _pinCode;
  late bool _isPinEnabled;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.settingsController.isDarkMode;
    _appBarColor = widget.settingsController.appBarColor;
    // _bodyTextSize = widget.settingsController.bodyTextSize;
    _bodyTextColor = widget.settingsController.bodyTextColor;
    _pinCode = widget.settingsController.pinCode;
    _isPinEnabled = widget.settingsController.isPinEnabled;
  }

  void _updateSettings() {
    widget.settingsController.updateSettings(
      SettingsModel(
        isDarkMode: _isDarkMode,
        appBarColor: _appBarColor.value,
        // bodyTextSize: _bodyTextSize,
        bodyTextColor: _bodyTextColor.value,
        pinCode: _pinCode,
        isPinEnabled: _isPinEnabled,
      ),
    );
    setState(() {
      AppConstants.themeMode = _isDarkMode ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sozlamalar'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          SwitchListTile(
            title: Text('Tungi holat'),
            value: _isDarkMode,
            onChanged: (bool value) {
              setState(() {
                _isDarkMode = value;
                _updateSettings();
              });
            },
          ),
          ListTile(
            title: Text('AppBar rangi'),
            trailing: Container(
              width: 50,
              height: 50,
              color: _appBarColor,
              child: GestureDetector(
                onTap: () async {
                  Color? selectedColor = await showDialog(
                    context: context,
                    builder: (context) =>
                        ColorPickerDialog(initialColor: _appBarColor),
                  );
                  if (selectedColor != null) {
                    setState(() {
                      _appBarColor = selectedColor;
                      _updateSettings();
                    });
                  }
                },
              ),
            ),
          ),
          ListTile(
            title: Text('Body matn hajmi'),
           
          ),
          ListTile(
            title: Text('Body matn rangi'),
            trailing: Container(
              width: 50,
              height: 50,
              color: _bodyTextColor,
              child: GestureDetector(
                onTap: () async {
                  Color? selectedColor = await showDialog(
                    context: context,
                    builder: (context) =>
                        ColorPickerDialog(initialColor: _bodyTextColor),
                  );
                  if (selectedColor != null) {
                    setState(() {
                      _bodyTextColor = selectedColor;
                      _updateSettings();
                    });
                  }
                },
              ),
            ),
          ),
          ListTile(
            title: Text("PIN kod o'rnatish"),
            trailing: Switch(
              value: _isPinEnabled,
              onChanged: (bool value) {
                setState(() {
                  _isPinEnabled = value;
                  if (!value) _pinCode = '';
                  _updateSettings();
                });
              },
            ),
          ),
          if (_isPinEnabled)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: '4 xonali PIN kod',
                ),
                keyboardType: TextInputType.number,
                maxLength: 4,
                onChanged: (value) {
                  setState(() {
                    _pinCode = value;
                    _updateSettings();
                  });
                },
              ),
            ),
        ],
      ),
    );
  }
}
