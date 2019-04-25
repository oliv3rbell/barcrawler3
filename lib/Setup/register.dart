import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'login.dart';

class Register extends StatefulWidget {
  static String tag = 'Register';
  @override
  RegisterPage createState() => RegisterPage();
}

class RegisterPage extends State<Register> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _name, _email, _password;

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(),
      body: Form(
        key: _formKey,
        child: Column(
          children: <Widget>[
            SizedBox(height: 48.0),
            TextFormField(
              validator: (input) {
                if(input.isEmpty){
                  return 'Provide a name';
                }
              },
              decoration: InputDecoration(
                hintText: 'Name',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
              onSaved: (input) => _name = input,
            ),
            SizedBox(height: 8.0),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              autofocus: false,
              validator: (input) {
                if(input.isEmpty){
                  return 'Provide an email';
                }
              },
              decoration: InputDecoration(
                labelText: 'Email',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
              onSaved: (input) => _email = input,
            ),
            SizedBox(height: 8.0),
            TextFormField(
              autofocus: false,
              validator: (input) {
                if(input.length < 6){
                  return 'Longer password please';
                }
              },
              decoration: InputDecoration(
                labelText: 'Password',
                contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
              ),
              onSaved: (input) => _password = input,
              obscureText: true,
            ),
            SizedBox(height: 8.0),
            RaisedButton(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),),
              onPressed: signUp,
              padding: EdgeInsets.all(12),
              color: Colors.redAccent,
              child: Text('Sign up', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 8.0),
            RaisedButton(
              shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(24),),
              //onPressed: ,
              padding: EdgeInsets.all(12),
              color: Colors.blueAccent,
              child: Text('Sign up with Facebook', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(height: 10.0),
            FlatButton(
              child: Text(
                'Already have a BarCrawler Account? \n \t \t \t \t \t \t \t \t \t \t \t \t Sign In',
                style: TextStyle(color: Colors.black54),
              ),
              onPressed: () {
                Navigator.of(context).pushNamed(LoginPage.tag);
              },
            ),
          ],
        )
      ),
    );
  }

  void signUp() async {
    if(_formKey.currentState.validate()){
      _formKey.currentState.save();
      try{
        await FirebaseAuth.instance.createUserWithEmailAndPassword(email: _email, password: _password);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
      }catch(e){
        print(e.message);
      }
    }
  }
}

