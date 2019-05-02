import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:barcrawler3/Maps.dart';
import 'package:barcrawler3/ProfileStuff/Feed.dart';

class Home extends StatefulWidget {
  static String tag = 'Home';
  const Home({Key key,
  @required this.user}) : super(key: key);
  final FirebaseUser user;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      bottomNavigationBar: DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(
            
            // Tab bar with seperate windows 
            automaticallyImplyLeading: false,
            bottom: TabBar(
              tabs:[
                Tab(icon: Icon(Icons.map),text:"MAP"),
                Tab(icon: Icon(Icons.home),text: "HOME",),
                Tab(icon: Icon(Icons.search),text: "Search"),

              ]
              
            ),
            
            title: Text('BarCrawler'),
          ),
          body: TabBarView(
            children: [
              //Page 1 (Left Page)
              MapPage(),
              // Page 2 (Home Profile Page)
              Center(
                child: Column(
                children: <Widget>[
                Container(
                    width: 150.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                        color: Colors.red,
                        image: DecorationImage(
                            image: NetworkImage(
                                'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.all(Radius.circular(75.0)),
                        boxShadow: [
                          BoxShadow(blurRadius: 7.0, color: Colors.black)
                        ])),
                        SizedBox(height: 15.0),
                Text(
                  'Tom Cruise',
                  style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Montserrat'),
                ),
                SizedBox(height: 15.0),
                Text(
                  'Welcome',
                  style: TextStyle(
                      fontSize: 17.0,
                      fontStyle: FontStyle.italic,
                      fontFamily: 'Montserrat'),
                ),
                new ButtonTheme.bar(        //Later on we can add functionality to these buttons and link them to
                                              //Message and Group Pages
                  child: new ButtonBar(
                  alignment: MainAxisAlignment.center,
                  children: <Widget>[
                          new RaisedButton(
                            onPressed:() {},     
                            child: Text(
                              'Messages',
                              style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                            ),
                            color: Colors.red,
                            
                          ),
                          new RaisedButton(
                            onPressed:() {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Feed()));
                              },
                            child: Text(
                              'Feed',
                              style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                            ),
                            color: Colors.red,
                          ),
                            ],
                  ),
                  ),
                
                SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.blueAccent,
                      color: Colors.blueGrey,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit Name',
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.blueAccent,
                      color: Colors.blueGrey,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {},
                        child: Center(
                          child: Text(
                            'Edit Photo',
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    )),
                    SizedBox(height: 25.0),
                Container(
                    height: 30.0,
                    width: 95.0,
                    child: Material(
                      borderRadius: BorderRadius.circular(20.0),
                      shadowColor: Colors.redAccent,
                      color: Colors.red,
                      elevation: 7.0,
                      child: GestureDetector(
                        onTap: () {
                          
                        },
                        child: Center(
                          child: Text(
                            'Log out',
                            style: TextStyle(color: Colors.white, fontFamily: 'Montserrat'),
                          ),
                        ),
                      ),
                    ))
              ],
            )),
  

              TextFormField(
                decoration: InputDecoration(labelText:"SEARCH"),
                focusNode: null,
                  //onFieldSubmitted: showSearch(context: ,delegate: ,query: ),
                  ),
                  ListBody(
                    children: <Widget>[
                      SingleChildScrollView( 
                        )
                     
                    ],
                  )
            ],
          ),
        ),
      ),
    );
  }
}