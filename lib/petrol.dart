import 'package:flutter/material.dart';
import 'gold.dart';
import 'p_type.dart';
import 'home.dart';
class Page3 extends StatefulWidget {
  const Page3({Key? key}):super(key:key);
  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  String totalPrice = petrols.first.getTotalPrice();
  Petrol petr = petrols.first;
  bool CardP = false;//KitStyle
  void updatePetrol(Petrol petr) {

    setState(() {
      this.petr = petr;
      totalPrice = petr.getTotalPrice();
    });
  }

  void updateCard(int Type) {

    setState(() {
      petr.Type = Type;
      totalPrice = petr.getTotalPrice();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Petrol Prices'),
        centerTitle: true,
      ),
      body: Center(child:Column(children:[ const SizedBox(height: 20.0),
        const Text('Select your petrol', style: TextStyle(fontSize: 25.0,)), const SizedBox(height: 10.0),
        MyDropdownMenuWidget(updatePetrol: updatePetrol), const SizedBox(height: 10.0),
        StyleWidget(updateType: updateCard), const SizedBox(height: 10.0),
        Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Card Payment', style: TextStyle(fontSize: 18.0,)),
              Checkbox(value: CardP, onChanged: (bool? value) {
                setState(() {
                  CardP = value as bool;
                  petr.Card = CardP;
                  totalPrice = petr.getTotalPrice();
                });
              },

              )]),
        const SizedBox(height: 10.0),
        Text('Total Price: $totalPrice', style: const TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),),
        const SizedBox(height: 20),

        const SizedBox(height:10),
        ElevatedButton(onPressed:(){
          Navigator.of(context)..push(
              MaterialPageRoute(builder:(context)=>const Page1())
          );

        },
            child: const Text('Exchange Rate')//Icon(Icons.navigate_before,size:50)
        ),const SizedBox(height:10),
        ElevatedButton(onPressed:(){
          Navigator.of(context).push(
              MaterialPageRoute(builder:(context)=>const Page2())
          );
        },
            child: const Text('Gold Prices')//Icon(Icons.navigate_next,size:50)
        ),
      ]),),
    );
  }
}


