import 'package:flutter/material.dart';
import 'package:bookstoreappui/models/writers.dart';

class ListOfWriters extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding:  EdgeInsets.fromLTRB(20.0,20.0,20.0,10.0),
          child: Center(child: Text('Authors',style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.w100,letterSpacing: 2.0,fontFamily: 'Billabong'),)),
        ),
        Container(
          height: 80.0,
          child: ListView.builder(
            padding: EdgeInsets.only(left: 10.0),
            scrollDirection: Axis.horizontal,
            itemCount: writers.length,
            itemBuilder: (BuildContext context,int index){
              Writers writer=writers[index];
              return GestureDetector(
                onTap: (){},
                child: Container(
                  margin: EdgeInsets.all(10.0),
                  height: 60.0,
                  width: 60.0,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [BoxShadow(
                        color: Colors.black26,
                        offset: Offset(0,2),
                        blurRadius: 6.0,
                      )],
                      border: Border.all(width: 2.0,color: Theme.of(context).primaryColor,)
                  ),
                  child: ClipOval(
                    child: Image(
                      height: 60.0,
                      width: 60.0,
                      image: AssetImage(writer.profileImageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
