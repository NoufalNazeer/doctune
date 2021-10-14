import 'package:doctune/modals/user_modal.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Signupuser extends StatefulWidget {
  @override
  _SignupuserState createState() => _SignupuserState();
}

class _SignupuserState extends State<Signupuser> {


  String? userName;
  String? userAccountEmail;
  String? userContact;
  String? userAccountpassword;

  var _formKeysignup = GlobalKey<FormState>();

  Color _mainColor = Color(0xff117684);
  List<Users> _userArray = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(children: <Widget>[
          Padding(padding: EdgeInsets.all(10),
            child: Form(
              key: _formKeysignup,
              child: Column(
                children: [
                  Text(
                    'Register new account',
                    style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: _mainColor),
                  ),
                  Container(
                    padding: EdgeInsets.only(
                        top: 13, left: 16, right: 16),
                    child: Column(
                      children: <Widget>[
                        TextFormField(
                          decoration: InputDecoration(
                            labelText: "Name",
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black54)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Colors.black54)),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.all(
                                  Radius.circular(4)),
                              borderSide: BorderSide(
                                  width: 1,
                                  color: Color(0xff3d63ff)),
                            ),
                          ),
                          textCapitalization:
                          TextCapitalization.sentences,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Enter your name';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userName = value;
                          },
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 16.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Email Id",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black54)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black54)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff3d63ff)),
                              ),
                              // prefixIcon: Icon(Icons.email),
                            ),
                            textCapitalization:
                            TextCapitalization.sentences,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your emailId';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userAccountEmail = value;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 16.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Contact",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black54)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black54)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff3d63ff)),
                              ),
                              // prefixIcon: Icon(Icons.email),
                            ),
                            textCapitalization:
                            TextCapitalization.sentences,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter your contact number';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userContact = value;
                            },
                          ),
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(top: 16.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              labelText: "Password",
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black54)),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(4)),
                                  borderSide: BorderSide(
                                      width: 1,
                                      color: Colors.black54)),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(
                                    Radius.circular(4)),
                                borderSide: BorderSide(
                                    width: 1,
                                    color: Color(0xff3d63ff)),
                              ),
                              // prefixIcon: Icon(Icons.email),
                            ),
                            textCapitalization:
                            TextCapitalization.sentences,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter password for your account';
                              }
                              return null;
                            },
                            onSaved: (value) {
                              userAccountpassword = value;
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              top: 10, bottom: 10),
                          child: RaisedButton(
                            color: _mainColor,
                            onPressed: () {
                              _submit();
                            },
                            child: Stack(
                              clipBehavior: Clip.none,
                              alignment: Alignment.center,
                              children: <Widget>[
                                Align(
                                  alignment: Alignment.center,
                                  child: Text("Create Account",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          letterSpacing: 0.6,
                                          fontWeight:
                                          FontWeight.w300)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }

  void _submit() async {
    final isValid = _formKeysignup.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      setState(() {});
    }
    _formKeysignup.currentState?.save();
    _getUsers();
  }

  _getUsers() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? userString =  prefs.getString('usersDB');
    print(userString);
    if(userString != null){
      _userArray = Users.decode(userString);
      print(_userArray);
      for( var i = 0;i<_userArray.length;i++){
        if(_userArray[i].email == userAccountEmail){
          _alertDialog(context, 'Account already exist for ${_userArray[i].userName}');
        }
        else{
          _saveUser();
        }
      }
    }
    else{
      _saveUser();
    }

  }

  _saveUser() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
  Users user = Users(userName: userName,contact: userContact,password: userAccountpassword,email: userAccountEmail);
  _userArray.add(user);
  print(_userArray);
  String usersString = Users.encode(_userArray);
  prefs.setString('usersDB', usersString);
  _alertDialog(context, 'Account created successfully');
  }



  void _alertDialog(context,String message) {
    Widget continueButton = FlatButton(
      child: Text('Ok', style: TextStyle(color:  Colors.green)),
      onPressed: () {
        Navigator.pop(context);
        Navigator.pushNamed(context, '/login');
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      title: Text('Message', style: TextStyle(fontSize: 18),),
      content: Text(message, style: TextStyle(fontSize: 13, color:Colors.black)),
      actions: [
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

}
