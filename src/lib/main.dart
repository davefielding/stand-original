import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:provider/provider.dart';
import 'package:standup_attempt1/application_theme.dart';
import 'package:standup_attempt1/constants/styles.dart';
import 'package:standup_attempt1/data/stand_up.dart';
import 'package:standup_attempt1/pages/stand_up_view.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String applicationSettingsBox = 'applicationSettings';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox(applicationSettingsBox);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final StandUp _standUp = StandUps.defaultStandUp();
  final ApplicationTheme currentTheme = ApplicationTheme();
  Box _applicationSettingsBox;

  @override
  dispose() {
    super.dispose();
    _applicationSettingsBox.close();
    Hive.close();
  }

  @override
  void initState() {
    super.initState();

    _applicationSettingsBox = Hive.box(applicationSettingsBox);

    var initialValue = _applicationSettingsBox.get('theme', defaultValue: true);
    if (initialValue != null && initialValue is bool) {
      currentTheme.setTheme(initialValue);
    }

    currentTheme.addListener(() {
      print('Theme change!');
      setState(() {});
      bool currentValue = _applicationSettingsBox.get('theme');
      if (currentValue != currentTheme.isDark) {
        _applicationSettingsBox.put('theme', currentTheme.isDark);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ApplicationTheme>.value(
      value: currentTheme,
      child: MaterialApp(
        title: 'Stand Up!',
        theme: applyThemeChanges(ThemeData.light()),
        darkTheme: applyThemeChanges(ThemeData.dark()),
        themeMode: currentTheme.currentTheme(),
        home: StandUpView(_standUp),
      ),
    );
  }

  ThemeData applyThemeChanges(ThemeData baseTheme) {
    return baseTheme.copyWith(
      accentColor: kAccentColor,
      floatingActionButtonTheme: baseTheme.floatingActionButtonTheme.copyWith(backgroundColor: kAccentColor),
      toggleableActiveColor: kAccentColor,
    );
  }
}
