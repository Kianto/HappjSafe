import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:happjsafe/models/news.dart';
import 'package:happjsafe/models/user.dart';
import 'package:happjsafe/views/widgets/news_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

///
/// Show list notification from government and urgent from user
///

class NotificationPage extends StatefulWidget {
  NotificationPage({Key key, @required this.loggedUser}) : super(key: key);

  final User loggedUser;

  @override
  State<StatefulWidget> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  void initState() {
    super.initState();
    if (null != widget.loggedUser.warnings && widget.loggedUser.warnings.isNotEmpty) {
      Fluttertoast.showToast(
          msg: "There is a defected case had used the same service with you. Please check yourself.",
          toastLength: Toast.LENGTH_SHORT,
          fontSize: 18.0,
          backgroundColor: Colors.orange,
          textColor: Colors.white,
          gravity: ToastGravity.CENTER,
          timeInSecForIos: 5,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[200],
        child: StreamBuilder(
            stream: Firestore.instance.collection('news').snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData)
                return Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[CircularProgressIndicator()],
                    )
                );

              List<News> warnList = widget.loggedUser.warnings;

              List<News> temp = [];
              for(var a in warnList) {
                if (a.isDanger == true) temp.add(a);
              }
              warnList = temp;

              List newsList = snapshot.data.documents
                  .map((doc) => News.fromJson(doc.data))
                  .toList();

              return CustomScrollView(slivers: [
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) => _buildItems(context, warnList[index]),
                    childCount: warnList.length,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) => _buildItems(context, newsList[index]),
                    childCount: newsList.length,
                  ),
                ),
              ]);
            }
        )
    );
  }

  Widget _buildItems(BuildContext context, News news) {
    return NewsCard(news: news);
  }
}
