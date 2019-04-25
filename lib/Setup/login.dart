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
  String _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 75.0),
            Hero(
              tag: 'hero',
              
              child: Text("BarCrawler.",
              style:TextStyle(
                fontSize: 50.0, fontWeight: FontWeight.bold
              )),
            ),
            SizedBox(height: 100.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                hintText: 'Email'
              ),
              onSaved: (input) => _email = input,
            ),
            SizedBox(height: 20.0),
            TextFormField(
              autofocus: false,
              validator: (input) {
                if(input.length < 6){
                  return 'Longer password please';
                }
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
                hintText: 'Password'
              ),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            SizedBox(height: 20.0),
            RaisedButton(
              onPressed: signIn,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24),
              ),
              padding: EdgeInsets.all(12),
              color: Colors.redAccent,
              child: Text('Sign in', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 20.0),
            FlatButton(
              child: Text(
                'Dont have a BarCrawler Account? \n \t \t \t \t \t \t \t \t \t \t Sign up ',
                style: TextStyle(color: Colors.black54),
              ),

              onPressed: () {
                Navigator.of(context).pushNamed(Register.tag);
              },
            ),
          ],
        )
      ),
    );
  }

  void signIn() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        FirebaseUser user = await FirebaseAuth.instance.signInWithEmailAndPassword(email: _email, password: _password);
        Navigator.push(context, MaterialPageRoute(builder: (context) => Home(user: user)));
      }catch(e){
        print(e.message);
      }
    }
  }
}


