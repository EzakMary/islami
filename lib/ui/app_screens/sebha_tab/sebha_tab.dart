import 'package:flutter/material.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SebhaTab extends StatefulWidget {
  const SebhaTab({super.key});

  @override
  State<SebhaTab> createState() => _SebhaTabState();
}

class _SebhaTabState extends State<SebhaTab> {
  int counter = 0;
  int indexTasbeh = 0;
  double rotate = 0.0;
  List<String> tasbeh = ["سبحان الله", "الحمد لله", "الله أكبر"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 35),
        Expanded(
          child: Stack(alignment: Alignment.topCenter, children: [
            Container(
                padding: EdgeInsets.only(top: 75),
                child: AnimatedRotation(
                    turns: rotate,
                    duration: Duration(seconds: 1),
                    child: Image.asset("assets/images/body of seb7a.png"))),
            Image.asset("assets/images/head of seb7a.png"),
          ]),
        ),
        Expanded(
          child: Column(
            children: [
              Text(AppLocalizations.of(context)!.numOfTasbeh),
              SizedBox(
                height: 20,
              ),
              Center(
                child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Color(0xffB7935F),
                        borderRadius: BorderRadius.circular(25)),
                    padding: EdgeInsets.all(30),
                    width: 100,
                    child: Text(
                      "${counter}",
                      style: AppTheme.appBarTitleTextStyle,
                    )),
              ),
            ],
          ),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor:AppColors.Primary,
            elevation:0,

          ),
          onPressed: () {
            setState(() {
              counter++;
              rotate += 1 / 30;
              if (counter == 33) {
                counter = 0;
                indexTasbeh++;
                if (indexTasbeh == tasbeh.length) {
                  indexTasbeh = 0;
                }
              }
              ;
            });
          },
          child: Text(tasbeh[indexTasbeh],
              style: AppTheme.appBarTitleTextStyle.copyWith(fontSize: 22)),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
