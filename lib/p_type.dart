import 'package:flutter/material.dart';
class Petrol {
  String model;
  int price;
  int Type = 1;
  bool Card = false;

  Petrol(this.model, this.price);
  // toString method used to display an item in a dropdown widget
  @override
  String toString() {
    return '$model Price/20L: \$$price';
  }
  String getTotalPrice() {

    int PetrolAmount = Card ? 2 : 0;
    if (Type == 1) {
      return (price + PetrolAmount).toStringAsFixed(0);
    }
    return (price * 1.2 + PetrolAmount).toStringAsFixed(0);
  }

}
List<Petrol> petrols = [
  Petrol('Gasoline', 20),
  Petrol('Diesel',18)
];
class MyDropdownMenuWidget extends StatefulWidget {
  const MyDropdownMenuWidget({required this.updatePetrol, super.key});

  final Function(Petrol) updatePetrol;

  @override
  State<MyDropdownMenuWidget> createState() => _MyDropdownMenuWidgetState();
}
class _MyDropdownMenuWidgetState extends State<MyDropdownMenuWidget> {


  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
        width: 210.0,
        initialSelection: petrols[0],
        onSelected: (petr) {
          setState(() {
            widget.updatePetrol(petr as Petrol); // use widget to access widget fields from state class
          });
        },
        dropdownMenuEntries: petrols.map<DropdownMenuEntry<Petrol>>((Petrol petr) {
          return DropdownMenuEntry(value: petr, label: petr.toString());
        }).toList());
  }
}
class StyleWidget extends StatefulWidget {
  const StyleWidget({required this.updateType, super.key});
  final Function(int) updateType;
  @override
  State<StyleWidget> createState() => _StyleWidgetState();
}

class _StyleWidgetState extends State<StyleWidget> {
  int _Type = 1;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      const Text('Type', style: TextStyle(fontSize: 18.0),),
      Radio( value: 1, groupValue: _Type, // all radio buttons in the same group should share a common variable
        onChanged: (val) {
          setState(() {
            _Type = val as int;
            widget.updateType(_Type); // use widget to access widget fields from state class
          });
        },
      ), const Text('Normal', style: TextStyle(fontSize: 18.0,)),
      Radio( value: 5, groupValue: _Type, // all radio buttons in the same group should share a common variable
          onChanged: (val) {
            setState(() {
              _Type = val as int;
              widget.updateType(_Type); // use widget to access widget fields from state class
            });
          }
      ), const Text('Premium', style: TextStyle(fontSize: 18.0),)
    ]);


  }
}