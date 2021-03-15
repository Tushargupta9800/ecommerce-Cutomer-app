import 'dart:async';
import 'package:customeremall/screens/Shop/SubCategoryPage.dart';
import 'package:customeremall/settingsAndVariables/variables.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

double opacity = 1;
Timer time;

class CategoryPage extends StatefulWidget {
  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> with SingleTickerProviderStateMixin {

  TabController tabController;
  String head = AppLanguage == "en"?CurrentCategoryEnglish:CurrentCategoryArabic;

  @override
  void initState() {

    time = new Timer.periodic(Duration(milliseconds: 800), (Timer t) {
      setState(() {
        if(opacity == 0.6) opacity = 1;
        else opacity = 0.6;
      });
    });

    tabController = TabController(length: AllSubCategoryList.length, vsync: this);
    tabController.animateTo(shiftToTab);
    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    time.cancel();
    super.dispose();
  }

  List<Tab> getTabs(){
    List<Tab> myTabs = [];

    for(String subcat in AllSubCategoryList){
      String temp;
      AppLanguage == "en"?temp = subcat.split(":")[0].trim():temp = subcat.split(":")[1].trim();
      myTabs.add(Tab(
        child: Text(temp, style: TextStyle(
            color: Colors.black
        ),),
      ),
      );
    };

    return myTabs;
  }

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(head, style: Theme.of(context).textTheme.headline5.copyWith(
            fontWeight: FontWeight.bold
        ),),
        actions: [
          IconButton(icon: Icon(Icons.search, color: Colors.black,), onPressed: (){}),
          IconButton(icon: Icon(Icons.shopping_cart, color: Colors.black,), onPressed: (){}),
        ],
        leading: IconButton(icon: Icon(Icons.arrow_back, color: Colors.black,), onPressed: (){
          Navigator.of(context).pop();
        }),
        backgroundColor: Colors.white,
        bottom: TabBar(
          isScrollable: true,
          indicatorColor: DarkBlue,
          controller: tabController,
          tabs: getTabs(),
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          for(String subcat in AllSubCategoryList)
          SubCategoryPage(subcat),
        ],
      ),
    );
  }
}