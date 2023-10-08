import 'package:flutter/material.dart';
import 'package:islami/details_screen/details_screen.dart';
import 'package:islami/model/details_screen_argument.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:islami/ui/utils/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class QuranTab extends StatelessWidget {
  const QuranTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Image.asset("assets/images/quran_tab_logo.png")),
        Divider(
          color: AppColors.Primary,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.suraName, style: AppTheme.appBarTitleTextStyle),
        Divider(
          color: AppColors.Primary,
          thickness: 3,
        ),
        Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount: constant.suraNames.length,
              itemBuilder: (_, index) {
                return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                      arguments: DetailsScreenArgs(SuraOrHadethName: constant.suraNames[index],
                          fileName: "${index+1}.txt",
                          isQuranFile: true)
                      );
                    },
                    child: Text(
                      "${constant.suraNames[index]}",
                      style: AppTheme.appBarTitleTextStyle
                          .copyWith(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ));
              },
            ))
      ],
    );
  }
}
