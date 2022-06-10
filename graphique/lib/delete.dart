import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Delete extends StatefulWidget {
  const Delete({Key? key}) : super(key: key);

  @override
  _DeleteState createState() => _DeleteState();
}

class _DeleteState extends State<Delete> {
  TextEditingController txttid = new TextEditingController();

  //fonction asych

  Future<void> DeleteData() async {
    var url = "http://localhost/isig_2020/delete.php";
    final reponse = await http.post(Uri.parse(url), body: {"id": txttid.text});
    Catch(ex) {
      print(ex.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("IDENTIFICATION"),
        backgroundColor: Colors.blue,
      ),
      body: ListView(
        children: [
          new TextField(
            controller: txttid,
            decoration: InputDecoration(
                labelText: "Entrez votre id", hintText: "Entrez votre code"),
          ),
          new RaisedButton(
            onPressed: () {
              DeleteData();
            },
            child: Text("Modifier"),
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
