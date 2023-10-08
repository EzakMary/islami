import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class SettingTap extends StatefulWidget {
  @override
  State<SettingTap> createState() => _SettingTapState();
}

class _SettingTapState extends State<SettingTap> {
  bool arabicSwitch =true;

  bool darkModeSwitch =true;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(height: 12,),
          Text(AppLocalizations.of(context)!.setting,style: AppTheme.textSettingStyle,textAlign: TextAlign.start),
          BuildRowSetting("العربية", arabicSwitch, (newValue){
            arabicSwitch=newValue;
            setState(() {

            });
          }),
          BuildRowSetting(AppLocalizations.of(context)!.darkMode, darkModeSwitch, (newValue) {
            darkModeSwitch=newValue;
            setState(() {

            });
          }),


        ],
      ),
    );
  }

  Widget BuildRowSetting (String switchName,bool switchValue, Function(bool) onChange){
    return Row(children: [
      SizedBox(width: 12,),
      Text(switchName,style: AppTheme.textSettingSwitchStyle,),
      Spacer(),
      Switch(value: switchValue, onChanged: onChange,activeColor: AppColors.Primary,)
    ],);
  }
}
