import 'package:flutter/material.dart';
import "package:cloud_firestore/cloud_firestore.dart";
//import 'package:firebase_';

class UserList extends StatelessWidget{
  String searchCriteria;
  @override
  Widget build(BuildContext context){
    TextFormField(
      validator: (input){
      if(input.isEmpty){
        return 'Search for a user';
      }
    },
    onFieldSubmitted: (input)=>searchCriteria = input,
    decoration: InputDecoration(
      labelText: 'Search Users'
    ),
    );
    return new StreamBuilder(
      stream: Firestore.instance.collection('users').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
        if(!snapshot.hasData) return new Text('Loading...');
        return new ListView(
          children: snapshot.data.documents.map((document){
            return new ListTile(
            title: new Text(document['firstName']),
          );
        }).toList(),
    );
      },
    );
  }
}
