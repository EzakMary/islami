import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:islami/details_screen/details_screen.dart';
import 'package:islami/ui/app_screens/home_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [Locale("en"),Locale("ar")],
      locale: Locale("ar"),
      routes: {
        HomeScreen.routeName:(_) => HomeScreen(),
        DetailsScreen.routeName:(_) =>DetailsScreen(),
      },
      initialRoute: HomeScreen.routeName,
    );
  }
}
