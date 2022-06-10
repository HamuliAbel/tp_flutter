import 'package:flutter/material.dart';

class Calculatrice extends StatefulWidget {
  const Calculatrice({Key? key}) : super(key: key);

  @override
  State<Calculatrice> createState() => _CalculatriceState();
}

class _CalculatriceState extends State<Calculatrice> {
  final signes = ["+", "-", "/", "*"];
  String? value;
//l'objet permet de recuper l'elemnt saisie par l'utilisateur et
//manipuler l'interne
  TextEditingController txtnombre1 = new TextEditingController();
  TextEditingController txtnombre2 = new TextEditingController();
  TextEditingController txtReposonse = new TextEditingController();
//TextEditingController sig = new TextEditingController();

  void addition() {
    int n1 = int.parse(txtnombre1.text);
    int n2 = int.parse(txtnombre2.text);

    txtReposonse.text = (n1 + n2).toString();
  }

  void Calculer() {
    int n1 = int.parse(txtnombre1.text);
    int n2 = int.parse(txtnombre2.text);

    if (value == "*") {
      txtReposonse.text = (n1 * n2).toString();
    } else if (value == "+") {
      txtReposonse.text = (n1 + n2).toString();
    } else if (value == "-") {
      txtReposonse.text = (n1 - n2).toString();
    } else if (value == "/") {
      if (n2 == 0) {
        txtReposonse.text = "Impossible division par 0";
      } else {
        txtReposonse.text = (n1 / n2).toString();
      }
    } else {
      txtReposonse.text = "choisissez un signe";
    }
  }

  void Refresh() {
    txtnombre1.text = "";
    txtnombre2.text = "";
    txtReposonse.text = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("My Calculator"),
          backgroundColor: Colors.blue,
        ),
        body: ListView(
          children: [
            TextField(
                keyboardType: TextInputType.number,
                controller: txtnombre1,
                decoration: InputDecoration(
                  labelText: "Nombre 1",
                  hintText: "Nombre 1: ",
                  fillColor: Colors.blueAccent,
                  focusColor: Colors.blueAccent,
                )),
            SizedBox(width: 10, height: 30),
            Container(
              width: 5,
              padding: EdgeInsets.symmetric(horizontal: 3, vertical: 3),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.lightGreen, width: 2)),
              child: DropdownButton<String>(
                items: signes.map(buildMenuItem).toList(),
                isExpanded: true,
                value: value,
                iconSize: 36,
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.black,
                ),
                onChanged: (value) => setState(
                  () => this.value = value,
                ),
              ),
            ),
            SizedBox(width: 30, height: 30),
            TextField(
                keyboardType: TextInputType.number,
                controller: txtnombre2,
                decoration: InputDecoration(
                  labelText: "Nombre 2",
                  hintText: "Nombre 2: ",
                  fillColor: Colors.blueAccent,
                  focusColor: Colors.blueAccent,
                )),
            RaisedButton(
              onPressed: () {
                Calculer();
              },
              child: Text("Calculer"),
              color: Colors.lightGreenAccent,
            ),
            new TextField(
                controller: txtReposonse,
                enabled: false,
                decoration: InputDecoration(
                  labelText: "Reponse",
                  hintText: "Reponse",
                  fillColor: Colors.blueAccent,
                  focusColor: Colors.blueAccent,
                )),
          ],
        ));
  }

  DropdownMenuItem<String> buildMenuItem(String item) => DropdownMenuItem(
        value: item,
        child: Text(item,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
      );
}
