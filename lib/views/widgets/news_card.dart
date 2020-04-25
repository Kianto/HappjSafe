import 'package:flutter/material.dart';
import 'package:happjsafe/models/news.dart';

class NewsCard extends StatelessWidget {
  final News news;

  const NewsCard({Key key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xfff8fbff)),
      padding: EdgeInsets.fromLTRB(15, 15, 20, 15),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: 8,
            height: 150,
            margin: EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: news.isDanger ? Colors.red : Colors.blueGrey,
              borderRadius: BorderRadius.all(Radius.circular(5))
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              boxShadow: [BoxShadow(color: Colors.black45, blurRadius: 6)]
            ),
            padding: EdgeInsets.all(20),
            child: _buildNews(context),
          ),
        ],
      ),
    );
  }

  Widget _buildNews(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          news.title.toUpperCase(),
          style: TextStyle(
            color: news.isDanger ? Colors.red : Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: MediaQuery.of(context).size.width - 103,
          height: 2,
          color: Color(0xfff5e8e8),
        ),
        SizedBox(height: 15),
        Container(
          child: Row(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.timer,
                color: Color(0xff3e444c),
              ),
              SizedBox(
                width: 5,
              ),
              Text(
                news.postTime,
                style: TextStyle(
                  color: Color(0xff3e444c),
                  fontStyle: FontStyle.italic,
                  //fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              )
            ],
          ),
        ),
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width - 103,
          child: Text(
            news.content,
            style: TextStyle(
              color: Color(0xff3e444c),
              fontStyle: FontStyle.italic,
              //fontWeight: FontWeight.bold,
              fontSize: 15
            ),
          ),
        ),
      ],
    );
  }

}
