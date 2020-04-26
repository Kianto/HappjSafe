import 'package:flutter/material.dart';

import 'package:flutter_dialogflow/dialogflow_v2.dart';
import 'package:happjsafe/resources/constant.dart';
import 'package:happjsafe/views/widgets/facts_message.dart';

class CareChatBot extends StatefulWidget {
  CareChatBot({Key key, this.title, this.userImage}) : super(key: key);

  final String title;
  final String userImage;

  @override
  _CareChatBotState createState() => new _CareChatBotState();
}

class _CareChatBotState extends State<CareChatBot> {
  final List<Facts> messageList = <Facts>[];
  final TextEditingController _textController = new TextEditingController();

  @override
  initState() {
    setState(() {
      messageList.add(
        Facts(
          text: "How are you today?",
          name: "Happj",
          isUser: false,
        )
      );
    });
    super.initState();
  }

  Widget _queryInputWidget(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(30))),
      child: Padding(
        padding: const EdgeInsets.only(left:8.0, right: 8),
        child: Row(
          children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                onSubmitted: _submitQuery,
                decoration: InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 4.0),
              child: IconButton(
                  icon: Icon(Icons.send, color: Theme.of(context).primaryColor,),
                  onPressed: () => _submitQuery(_textController.text)),
            ),
          ],
        ),
      ),
    );
  }

  void agentResponse(query) async {
    _textController.clear();
    AuthGoogle authGoogle =
    await AuthGoogle(fileJson: "assets/NewAgent-315.json").build();
    Dialogflow dialogFlow =
    Dialogflow(authGoogle: authGoogle, language: Language.english);
    AIResponse response = await dialogFlow.detectIntent(query);

    if (null != response.getMessage()) {
      Facts message = Facts(
        text: response.getMessage() ??
            CardDialogflow(response.getListMessage()[0]).title,
        name: "Happj",
        isUser: false,
      );
      setState(() {
        messageList.insert(0, message);
      });
    }
  }

  void _submitQuery(String text) {
    _textController.clear();
    Facts message = new Facts(
      text: text,
      name: "User",
      isUser: true,
      imageLink: widget.userImage,
    );
    setState(() {
      messageList.insert(0, message);
    });
    agentResponse(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(Constants.appName_SAFE),
      ),
      body: Column(children: <Widget>[
        Flexible(
            child: ListView.builder(
              padding: EdgeInsets.all(8.0),
              reverse: true, //To keep the latest messages at the bottom
              itemBuilder: (_, int index) => messageList[index],
              itemCount: messageList.length,
            )),
        _queryInputWidget(context),
      ]),
    );
  }
}