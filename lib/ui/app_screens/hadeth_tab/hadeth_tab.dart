import 'package:flutter/material.dart';
import 'package:islami/details_screen/details_screen.dart';
import 'package:islami/model/details_screen_argument.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:islami/ui/utils/constant.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class HadethTab extends StatelessWidget {
  List<String> hadethTaps =List.generate(50, (index)  {
    return "  ${index+1}حديث رقم  ";
  });
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 3, child: Image.asset("assets/images/hadeth_tap_logo.png")),
        Divider(
          color: AppColors.Primary,
          thickness: 3,
        ),
        Text(AppLocalizations.of(context)!.hadeth, style: AppTheme.appBarTitleTextStyle),
        Divider(
          color: AppColors.Primary,
          thickness: 3,
        ),
        Expanded(
            flex: 7,
            child: ListView.builder(
              itemCount:50,
              itemBuilder: (_, index) {
                return TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, DetailsScreen.routeName,
                          arguments: DetailsScreenArgs(SuraOrHadethName: hadethTaps[index],
                              fileName: "h${index+1}.txt",
                              isQuranFile: false)
                      );
                    },
                    child: Text(
                      "${hadethTaps[index]}",
                      style: AppTheme.appBarTitleTextStyle
                          .copyWith(fontWeight: FontWeight.normal),
                      textAlign: TextAlign.center,
                    ));
              },
            ))
      ],
    );
  }}
