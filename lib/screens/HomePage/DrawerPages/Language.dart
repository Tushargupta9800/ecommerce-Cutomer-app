import 'package:customeremall/settingsAndVariables/settings.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';

class Language extends StatefulWidget {
  @override
  _LanguageState createState() => _LanguageState();
}

class _LanguageState extends State<Language> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
       decoration: BoxDecoration(
         gradient: BackgroundGradientColor,
       ),
        width: ScreenWidth,
        height: ScreenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [

            SizedBox(height: 10,),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Choose Language", style: HeaderBold(Colors.white, H1),),
                Text("اختر اللغة", style: HeaderBold(Colors.white, H1),),
              ],
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: (){
                    setState(() {
                      changeLanguage("en", context);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: ScreenWidth,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(
                        border: Border.all(color: DarkBlue,width: 4),
                    ),
                    child: Center(child: Text("English",style: HeaderBold(White, H4),)),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    setState(() {
                      changeLanguage("ar", context);
                    });
                    Navigator.of(context).pop();
                  },
                  child: Container(
                    width: ScreenWidth,
                    padding: EdgeInsets.symmetric(vertical: 15),
                    margin: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: DarkBlue,width: 4),
                    ),
                    child: Center(child: Text("عربي",style: HeaderBold(White, H4),)),
                  ),
                ),
              ],
            ),

            SizedBox(height: 10,),

          ],
        ),
      ),
    );
  }
}
