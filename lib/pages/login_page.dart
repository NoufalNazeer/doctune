import 'dart:convert';

import 'package:doctune/modals/user_modal.dart';
import 'package:doctune/pages/signup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  var _formKey = GlobalKey<FormState>();

  Color _mainColor = Color(0xff117684);
  Color _underlineColor = Color(0xFFCCCCCC);

  String userEmail = '';
  String userPassword = '';
  bool _obscureText = true;
  IconData _iconVisible = Icons.visibility_off;

  List<Users> _users = [];


  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  void _toggleObscureText() {
    setState(() {
      _obscureText = !_obscureText;
      if (_obscureText == true) {
        _iconVisible = Icons.visibility_off;
      } else {
        _iconVisible = Icons.visibility;
      }
    });
  }

  void _submit() async {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    } else {
      setState(() {});
    }
    _formKey.currentState?.save();
    _getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
        backgroundColor: Colors.white,
        body: AnnotatedRegion<SystemUiOverlayStyle>(
          value:
              SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light),
          child: Stack(
            children: <Widget>[
              // top blue background gradient
              Padding(
                padding: EdgeInsets.only(top: 75),
                child: Container(
                  height: MediaQuery.of(context).size.height / 6.5,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/logo.jpeg'),
                  )),
                ),
              ),
              // set your logo here
              Form(
                  key: _formKey,
                  child: ListView(
                    children: <Widget>[
                      // create form login
                      SizedBox(height: MediaQuery.of(context).size.height / 10),
                      Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        elevation: 5,
                        margin: EdgeInsets.fromLTRB(
                            32,
                            MediaQuery.of(context).size.height / 3.5 - 72,
                            32,
                            0),
                        color: Colors.white,
                        child: Container(
                            margin: EdgeInsets.fromLTRB(24, 0, 24, 20),
                            child: Column(
                              children: <Widget>[
                                SizedBox(
                                  height: 40,
                                ),
                                Center(
                                  child: Text(
                                    'SIGN IN',
                                    style: TextStyle(
                                        color: _mainColor,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w900),
                                  ),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      prefixIcon: Icon(
                                        Icons.person,
                                        color: _mainColor,
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide:
                                            BorderSide(color: _underlineColor),
                                      ),
                                      labelText: 'Email',
                                      labelStyle:
                                          TextStyle(color: Colors.grey[700])),
                                  onFieldSubmitted: (value) {},
                                  onSaved: (value) {
                                    userEmail = value.toString();
                                  },
                                  validator: (value) {
                                    if (value!.isEmpty ||
                                        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                            .hasMatch(value)) {
                                      return 'Enter a valid email address';
                                    }
                                    return null;
                                  },
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                TextFormField(
                                  obscureText: _obscureText,
                                  decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.vpn_key_outlined,
                                        color: _mainColor),
                                    focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.grey.shade600)),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: _underlineColor),
                                    ),
                                    labelText: 'Password',
                                    labelStyle:
                                        TextStyle(color: Colors.grey[700]),
                                    suffixIcon: IconButton(
                                        icon: Icon(_iconVisible,
                                            color: Colors.grey[700], size: 20),
                                        onPressed: () {
                                          _toggleObscureText();
                                        }),
                                  ),
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return 'Enter a valid password!';
                                    }
                                    return null;
                                  },
                                  onSaved: (value) {
                                    userPassword = value.toString();
                                  },
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                SizedBox(
                                  width: double.maxFinite,
                                  child: RaisedButton(
                                      elevation: 2,
                                      shape: RoundedRectangleBorder(
                                          side: BorderSide(
                                              color: _mainColor,
                                              width: 1,
                                              style: BorderStyle.solid),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      padding:
                                          EdgeInsets.symmetric(vertical: 12),
                                      textColor: Colors.white,
                                      color: _mainColor,
                                      onPressed: () {
                                        _submit();
                                       // _getUsers();
                                      },
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        // ignore: prefer_const_literals_to_create_immutables
                                        children: [
                                          Icon(Icons.lock_open_sharp),
                                          Text('Login',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      )),
                                ),
                                SizedBox(
                                  height: 50,
                                ),
                                Align(
                                  alignment: Alignment.center,
                                  child: GestureDetector(
                                    onTap: () {
                                    Navigator.pushNamed(context, '/signup');
                                    //  Navigator.of(context).push(MaterialPageRoute(builder: (context) =>
                                    //      Signupuser()));
                                    },
                                    child: Text(
                                      'New User ? Create new account',
                                      style: TextStyle(fontSize: 15),
                                    ),
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }

   _getUsers() async{
     SharedPreferences prefs = await SharedPreferences.getInstance();
     final String? userString =  prefs.getString('usersDB');
     _users = Users.decode(userString!);
     for( var i = 0;i<_users.length;i++){
       if(_users[i].email == userEmail){
         if(_users[i].password == userPassword){
           print('User found');
           Navigator.pushNamedAndRemoveUntil(context, '/home', ModalRoute.withName('/home'),arguments: {"userName":_users[i].userName});

         } else {
           print('User password wrong');
           showSnackbar('Invalid password');
         }
       }
       else{
         showSnackbar('User not found');
       }
     }

   }


  showSnackbar(msg) {
    _scaffoldKey.currentState?.showSnackBar(SnackBar(
      behavior: SnackBarBehavior.floating,
      padding: EdgeInsets.all(10),
      backgroundColor: _mainColor,
      content: Text(
        msg,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
      duration: Duration(seconds: 4),
    ));
  }


}
