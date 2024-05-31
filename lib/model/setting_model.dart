class SettingsModel {
  bool isDarkMode;
  int appBarColor;
  // double bodyTextSize;
  int bodyTextColor;
  String pinCode;
  bool isPinEnabled;

  SettingsModel({
    required this.isDarkMode,
    required this.appBarColor,
    // required this.bodyTextSize,
    required this.bodyTextColor,
    required this.pinCode,
    required this.isPinEnabled,
  });
}