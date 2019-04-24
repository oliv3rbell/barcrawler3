import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'register.dart';
import 'home.dart';


class LoginPage extends StatefulWidget {
  static String tag = 'LoginPage';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _email, _password;
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
        //child: Image.asset('assets/images/logo.png'),
        child: Text("BarCrawler.",
        style:TextStyle(
          fontSize: 50.0, fontWeight: FontWeight.bold
        )),
      
    );

    final email = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      initialValue: 'Example@gmail.com',
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
       onSaved: (input) => _email = input
    );

    final password = TextFormField(
      autofocus: false,
      initialValue: 'password',
      obscureText: true,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      onSaved: (input) => _password = input,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          signIn();
        },
        padding: EdgeInsets.all(12),
        color: Colors.redAccent,
        child: Text('Log In', style: TextStyle(color: Colors.white)),
      ),
    );

    final signUp = FlatButton(
      child: Text(
        'Dont have a BarCrawler Account? \n \t \t \t \t \t \t \t \t \t \t Sign up ',
        style: TextStyle(color: Colors.black54),
      ),

      onPressed: () {
        Navigator.of(context).pushNamed(Register.tag);
      },
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 4.0),
            loginButton,
            SizedBox(height: 10.0),
            signUp,
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async{
    final formState = _formKey.currentState;
    if(formState.validate()){
      formState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }catch(e){
        print(e.messge); //More Firebase Authentication for list activation (Oliver)
      }
    }
  }
}

