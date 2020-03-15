import 'package:bookstoreappui/models/books.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookCarousel extends StatelessWidget {
  final PageController pageController;
  final String title;
  final List<Books> books;

  BookCarousel({this.pageController,this.title,this.books});

  _buildBook(BuildContext context,int index){
    Books book=books[index];
    return AnimatedBuilder(
      animation: pageController,
      builder: (BuildContext context,Widget widget){
        double value=1;
        if (pageController.position.haveDimensions){
          value=pageController.page-index;
          value=(1-(value.abs()*0.40)).clamp(0.0, 1.0);
        }
        return Center(
          child: SizedBox(height: Curves.easeInOut.transform(value)*400,
            child: widget,
          ),
        );
      },
      child: Stack(
        children: <Widget>[
         Container(
           margin: EdgeInsets.all(5.0),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(15.0),
             boxShadow: [BoxShadow(
               color: Colors.black26,
               offset: Offset(0,2),
               blurRadius: 6.0,
             ),]
           ),
           child: ClipRRect(
             borderRadius: BorderRadius.circular(15.0),
             child: Image(
               height: 300.0,
               image: AssetImage(book.imageUrl),

             ),
           ),
         ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment:CrossAxisAlignment.center ,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.fromLTRB(20.0,20.0,20.0,10.0),
          child: Text('Books',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w100,letterSpacing: 2.0,fontFamily: 'Billabong'),),
        ),
        Container(
          height: 300.0,
          width: 270.0,
          child: PageView.builder(
               controller: pageController,
               itemCount: books.length,
               itemBuilder: (BuildContext context, int index){
                return _buildBook(context,index);
               },
          ),
        ),
      ],
    );
  }
}
