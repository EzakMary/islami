import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/model/details_screen_argument.dart';
import 'package:islami/ui/utils/app_colors.dart';
import 'package:islami/ui/utils/app_theme.dart';

class DetailsScreen extends StatefulWidget {
  static const String routeName = "DetailsScreen";

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late DetailsScreenArgs arguments;

  String fileContent = "";

  @override
  Widget build(BuildContext context) {
    arguments = ModalRoute.of(context)!.settings.arguments as DetailsScreenArgs;
    if (fileContent.isEmpty) {
      readFile();
    }
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage("assets/images/bg3.png"), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          iconTheme: IconThemeData(color: AppColors.secondry),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text("Islami",
              style: AppTheme.appBarTitleTextStyle),
        ),
        body: SingleChildScrollView(child: Container(
          decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(15)),
          padding: EdgeInsets.all(5),
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Text(" ${arguments.SuraOrHadethName} ",style: AppTheme.appBarTitleTextStyle),
              Divider(color: AppColors.Primary,thickness: 5),
              fileContent.isEmpty ? Center(child: CircularProgressIndicator()) : Text(fileContent,
              style: TextStyle(fontSize:25,color: AppColors.secondry,),
                textDirection: TextDirection.rtl,
              ),
            ],
          ),
        ))
      ),
    );
  }

  void readFile() async {
    String file =
        await rootBundle.loadString(arguments.isQuranFile ?"assets/files/quran/${arguments.fileName}"
        :"assets/files/ahadeth/${arguments.fileName}"
        );
    fileContent = file;

    List<String> fileLines =file.split("\n");
    for(
    int i =0 ; i< fileLines.length ; i++
    ){
      fileLines[i] += arguments.isQuranFile? "(${i+1})": " ";
    };
    fileContent=fileLines.join();
    setState(() {

    });
  }
}
