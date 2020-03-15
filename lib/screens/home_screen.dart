import 'package:bookstoreappui/models/books.dart';
import 'package:bookstoreappui/models/writers.dart';
import 'package:bookstoreappui/widgets/book_carousel.dart';
import 'package:bookstoreappui/widgets/listofwriters.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  TabController _tabController;
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController=TabController(length:3, vsync:this );
    _pageController=PageController(initialPage: 0,viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        title:Center(child: Text('BookStore', style: TextStyle(color:Colors.purpleAccent,fontSize: 28,fontWeight: FontWeight.bold,letterSpacing: 10.0,fontFamily: 'Billabong',))) ,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          labelColor: Theme.of(context).primaryColor,
          labelStyle: TextStyle(fontSize: 18.0,fontWeight: FontWeight.w600),
          unselectedLabelStyle:TextStyle(fontSize: 18.0),
          tabs: <Widget>[
            Tab(text: 'Novels',),
            Tab(text: 'Stories',),
            Tab(text: 'Biography',)
          ],
        ),
      ),
      body: ListView(
        children: <Widget>[
          ListOfWriters(),
          BookCarousel(pageController:_pageController,title:'Books',books:books,),
        ],
      ),

    );
  }
}
