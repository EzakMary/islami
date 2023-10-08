import 'package:flutter/material.dart';
import 'package:islami/ui/app_screens/hadeth_tab/hadeth_tab.dart';
import 'package:islami/ui/app_screens/quran_tab/qurab_tab.dart';
import 'package:islami/ui/app_screens/radio_tab/radio_tab.dart';
import 'package:islami/ui/app_screens/sebha_tab/sebha_tab.dart';
import 'package:islami/ui/app_screens/setting/setting.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = "HomeSceen";



  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentTabIndex = 0;
  List<Widget> appTabs =[
    QuranTab(),
    HadethTab(),
    SebhaTab(),
    RadioTab(),
    SettingTap()
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: Text(AppLocalizations.of(context)!.islami,
                style:AppTheme.appBarTitleTextStyle),
          ),
          body: appTabs[currentTabIndex] ,
          bottomNavigationBar: buildBottomNavigationBar()
      ),
    );
  }

  Widget buildBottomNavigationBar() => Theme(
    data: ThemeData(canvasColor: AppColors.Primary),
    child: BottomNavigationBar(
      currentIndex: currentTabIndex,
      onTap: (index) {
        setState(() {
          currentTabIndex = index;
        });
      },
      iconSize: 30,
      selectedItemColor: AppColors.secondry,
      items: [
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/quran.png")),
            label: AppLocalizations.of(context)!.quran),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/hadeth.png")),
            label: AppLocalizations.of(context)!.hadeth),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/sebha.png")),
            label: AppLocalizations.of(context)!.sebha),
        BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/radio.png")),
            label: AppLocalizations.of(context)!.radio),
        BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: AppLocalizations.of(context)!.setting),
      ],
    ),
  );
}

