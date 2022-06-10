import 'package:flutter/material.dart';

class identite extends StatefulWidget {
  const identite({ Key? key }) : super(key: key);

  @override
  _identiteState createState() => _identiteState();
}

class _identiteState extends State<identite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Identite"),
        backgroundColor: Colors.blueAccent,
      ),
      
      body: ListView(
        children: [
          new TextField(
            controller: null,
            decoration: InputDecoration(
              labelText: "Nom",
              hintText: "Entrez votre nom :"
            ),
          ),
          SizedBox(width: 20),
          new TextField(
            controller: null,
            decoration: InputDecoration(
              labelText: "Entrez votre adresse",
              hintText: "Entrez votre adresse :",
            ),
          ),
          SizedBox(width: 20),
          new TextField(
            controller: null,
            keyboardType: TextInputType.phone,
            enabled: true,
            decoration: InputDecoration(
              labelText: "Entrez votre phone number",
              hintText: "Entrez votre phone number :"
            ),
          ),
          SizedBox(width: 20),
          RaisedButton(
            onPressed: (){},
            child: Text("Entregistrer"),
            color: Colors.green,
            )
        ],
      ),
    );
  }
}