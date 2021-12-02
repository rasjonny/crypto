import 'package:crypto/net/flutter_fire.dart';
import 'package:flutter/material.dart';

class AddView extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  AddView({Key? key}) : super(key: key);

  @override
  _AddViewState createState() => _AddViewState();
}

class _AddViewState extends State<AddView> {
  TextEditingController addCoins = TextEditingController();
  List<String> coins = ['shiling', 'simuni', 'nus'];
  String dropDownValue = "shiling";
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: [
          DropdownButton(
            value: dropDownValue,
            onChanged: (String? value) {
              setState(() {
                dropDownValue = value!;
              });
            },
            items: coins.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
          ),
          TextFormField(
            controller: addCoins,

            // ignore: prefer_const_constructors
            decoration: InputDecoration(
              hintText: 'addCoins',
              hintStyle: const TextStyle(
                color: Colors.white,
              ),
              labelText: 'AddCoins',
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 45,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueAccent),
            child: MaterialButton(
                child: const Text('addCoin'),
                onPressed: () async {
                  await addCoin(dropDownValue, addCoins.text);
                  Navigator.of(context).pop();
                }),
          ),
        ],
      ),
    );
  }
}
