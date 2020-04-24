import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


///
/// Login form - authenticate user by phone
///

class LoginScreen extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
    final TextEditingController _phoneNumberController = TextEditingController();
    final TextEditingController _otpController = TextEditingController();

  bool isValid = false;
  bool otpScreen = false;
  bool isenbale = false;

  Future<Null> validate(AsyncSnapshot updateState) async {
    if (_phoneNumberController.text.length == 10) {
      setState(() {
        isValid = true;
      });
    }
    else 
    {
      setState(() {
        isValid = false;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body:Stack(
      children: <Widget>[
            Container(
              
              child:Image.asset(
              'assets/images/bg.png',
               fit: BoxFit.fill,
        ),
              width: double.infinity,
              color: Colors.black.withOpacity(0.2),
            ),
        Align (
          alignment: Alignment.bottomCenter,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration (
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(1),
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.7),
                      Colors.black.withOpacity(0.6),
                      Colors.black.withOpacity(0.5),

                      Colors.black.withOpacity(0.1),
                      Colors.black.withOpacity(0.05),
                      Colors.black.withOpacity(0.025),
                    ]
                )
            ),
            child: Padding(
              padding: const EdgeInsets.only(top: 0.8),
              child: Container(),
            ),
          ),
        ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
            SizedBox(height:300),
            SizedBox(height: 10,),
            Container(
             margin: EdgeInsets.all(20),
                   padding: EdgeInsets.fromLTRB(30, 10,30, 30),
                   decoration: BoxDecoration(
                     color: Colors.white,
                     border: Border.all(width: 1,color: Colors.grey),
                     borderRadius: BorderRadius.circular(20)
                   ),
                   child: Column(
                     children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30,10,30,20),
                    child: Text("Login", style: TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    ),
                  ),
                          Padding(
                       padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                    child: StreamBuilder(
                        builder: (state,snapshot)=> TextField(
                              controller: _phoneNumberController,
                              autofocus: true,
                                        onChanged: (text) {
                                          validate(snapshot);
                                        },
                              style: TextStyle(fontSize: 18, color: Colors.black),
                              decoration: InputDecoration(
                                  labelText: "Phone",
                                  enabled: !isenbale,
                                  errorText:
                                      snapshot.hasError ? snapshot.error : null,
                                      filled: true,
                                      fillColor: Colors.white,
                                  prefixIcon: Container(
                                      width: 50, child: Icon(Icons.phone)),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Color(0xffCED0D2), width: 1),
                                      borderRadius:
                            BorderRadius.all(Radius.circular(6)))),
                            )),
                  ),
                    !otpScreen?Container(
                      alignment: Alignment.topLeft,
                      child: Text("*Note: Please provide a valid digit phone number",style: TextStyle(fontSize: 15, color: Colors.red), )):
                    Container(
                      child: StreamBuilder(
                        builder: (context, snapshot) =>Column(
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: TextField(
                                      controller: _otpController,
                                          style: TextStyle(fontSize: 18, color: Colors.black),
                                          decoration: InputDecoration(
                                              errorText:
                                                  snapshot.hasError ? snapshot.error : null,
                                              labelText: "OTP",
                                              filled: true,
                                              fillColor: Colors.white,
                                              prefixIcon: Icon(Icons.all_out),
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Color(0xffCED0D2), width: 1),
                                                  borderRadius:
                                                      BorderRadius.all(Radius.circular(6)))),
                                          ),
                                ),
                                SizedBox(width: 10,),
                                GestureDetector(
                                  child: Text("Get OTP",
                                  style: TextStyle(
                                    fontSize: 22,
                                    color: Colors.blue,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic),
                                    )
                                  )
                              ],
                            ),
                            SizedBox(height: 20,),
                            Text("* Note: OTP code from service will send for you, please check in your message.",
                            style: TextStyle(
                              fontSize: 15,
                              color: Colors.red
                            ),
                              )
                          ],
                        )
                      ),
                    )
                     ],
                   ),
                 ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(20, 20,20, 0),
                  child: SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: RaisedButton(
                      color: Colors.blue,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10))
                      ),
                      onPressed:_setOtp,
                                            child: Text (!isValid? "ENTER PHONE NUMBER": "CONTINUE", style: TextStyle(
                                              fontSize: 15,
                                              color: Colors.white,
                                            ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 50,
                                      ),
                                      Text("#DON'T GO OUT AT THIS TIME",
                                       style: TextStyle(fontSize: 20, color: Colors.grey, fontStyle: FontStyle.italic),
                                       ),
                                       Text("#STAY AT HOME IS RESPONSIBILITY",
                                       style: TextStyle(fontSize: 20, color: Colors.grey, fontStyle: FontStyle.italic),
                                       )
                                    ],
                                  ),
                                )],
                              ),
                          );
                        }
void _onLogin() {
                         
}
                                        
void _setOtp() {
  if (!isValid) return null;
  else{
  setState(() {
    otpScreen = true;
    isenbale = true;
    });
    if( _otpController.text.length ==6) return _onLogin();
    else return null;
  }
  }
}