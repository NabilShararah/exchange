import 'package:flutter/material.dart';

import 'petrol.dart';
class Page2 extends StatefulWidget {
  const Page2({Key? key}):super(key:key);
  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  double _amount=0.0;
  String from='USD';
  String to='';
  bool Tax=false;
  void updateText(String text) {
    // we need to call the setState method, so that the state class will redraw the widget
    setState(() {
      _amount=double.tryParse(text)??0.0;

    });
  }
  double getExchangeAmount(){
    if( to=='Gram of 18K'){
      return 47.43;
    }
    else if(to=='Gram of 21K'){
      return 55.33;
    }
    return 1.0;
  }
  double CalculateAmount(){
    double Rate=getExchangeAmount();
    double ConvertedAmount=_amount/Rate;
    if(Tax){
      ConvertedAmount*=0.95;
    }
    return ConvertedAmount;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: const Text('Gold Prices'),
        centerTitle: true,
      ),
      backgroundColor: Colors.amberAccent,
      body: Center(child:Column(children:[const SizedBox(height: 20.0,),
        const SizedBox(height: 20.0),
        Text('You want to exchange : $_amount $from',
            style: const TextStyle(fontSize: 18.0)),
        const SizedBox(height: 20.0,),
        SizedBox(width: 300.0, height: 50.0,
          child: TextField(
            style: const TextStyle(fontSize: 18.0),
            decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Enter amount to exchange'
            ),
            onChanged: (text) {
              updateText(text);
            }, // call the updateText function
          ),
        ),
        const SizedBox(height: 20.0),
        const SizedBox(height: 20.0),
        Text('Select Gold type:'),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 'Gram of 18K',
              groupValue: to,
              onChanged: (value) {
                setState(() {
                  to = value.toString();
                });
              },
            ),
            Text(' 18K'),
            Radio(
              value: 'Gram of 21K',
              groupValue: to,
              onChanged: (value) {
                setState(() {
                  to = value.toString();
                });
              },
            ),
            Text('21K'),
          ],
        ),
        const SizedBox(height: 20.0),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Checkbox(
              value: Tax,
              onChanged: (value) {
                setState(() {
                  Tax = value ?? false;
                });
              },
            ),
            Text('Include Tax'),
          ],
        ),
        const SizedBox(height: 20.0),
        Text('Converted Amount: ${CalculateAmount().toStringAsFixed(2)} $to'),

        const SizedBox(height:10),
        ElevatedButton(onPressed:(){
          Navigator.of(context).pop();/*push(
              MaterialPageRoute(builder:(context)=>const Page1())
          );*/
        },style: ElevatedButton.styleFrom(
          primary: Colors.black,),
            child: const Text('Exchange Rate')//Icon(Icons.navigate_next,size:50)
        ),
        const SizedBox(height:10),
        ElevatedButton(onPressed:(){
          Navigator.of(context).push(
              MaterialPageRoute(builder:(context)=>const Page3())
          );
        },style: ElevatedButton.styleFrom(
          primary: Colors.black,),
            child: const Text('Petrol Prices')//Icon(Icons.navigate_next,size:50)
        ),
      ]),),
    );
  }
}

