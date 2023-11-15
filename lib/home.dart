import 'package:exchange/petrol.dart';
import 'package:flutter/material.dart';


/*class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
 double _amount=0.0;
 String from='USD';
 String to='USD';
 bool Tax=false;



 // The updateText method will be called when the text in the TextField changes
  void updateText(String text) {
    // we need to call the setState method, so that the state class will redraw the widget
    setState(() {
      _amount=double.tryParse(text)??0.0;

    });
  }
  double getExchangeAmount(){
    if( to=='EURO'){
      return 0.93;
    }
    else if(to=='LBP'){
      return 89500;
    }
    return 1.0;
  }
  double CalculateAmount(){
    double Rate=getExchangeAmount();
    double ConvertedAmount=_amount*Rate;
    if(Tax){
      ConvertedAmount*=0.95;
    }
    return ConvertedAmount;
  }
 @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text(
            style: TextStyle(fontSize: 25.0), 'Exchange Rate Calculator',),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            children: [const SizedBox(height: 20.0,),
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
              Text('Select Target Currency:'),
              Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio(
                    value: 'EURO',
                    groupValue: to,
                    onChanged: (value) {
                      setState(() {
                        to = value.toString();
                      });
                    },
                  ),
                  Text('EURO'),
                  Radio(
                    value: 'LBP',
                    groupValue: to,
                    onChanged: (value) {
                      setState(() {
                        to = value.toString();
                      });
                    },
                  ),
                  Text('LBP'),
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

            ],
          ),
        )
    );
  }
}*/
import 'gold.dart';
//import 'page3.dart';
class Page1 extends StatefulWidget {
  const Page1({Key? key}):super(key:key);
  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  double _amount=0.0;
  String from='USD';
  String to='USD';
  bool Tax=false;
  void updateText(String text) {
    // we need to call the setState method, so that the state class will redraw the widget
    setState(() {
      _amount=double.tryParse(text)??0.0;

    });
  }
  double getExchangeAmount(){
    if( to=='EURO'){
      return 0.93;
    }
    else if(to=='LBP'){
      return 89500;
    }
    return 1.0;
  }
  double CalculateAmount(){
    double Rate=getExchangeAmount();
    double ConvertedAmount=_amount*Rate;
    if(Tax){
      ConvertedAmount*=0.95;
    }
    return ConvertedAmount;
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black,
        title: const Text('Exchange Rate',style: TextStyle(color: Colors.lightGreen),),
        centerTitle: true,
      ),
      backgroundColor: Colors.lightGreen,
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
        Text('Select Target Currency:'),
        Row(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Radio(
              value: 'EURO',
              groupValue: to,
              onChanged: (value) {
                setState(() {
                  to = value.toString();
                });
              },
            ),
            Text('EURO'),
            Radio(
              value: 'LBP',
              groupValue: to,
              onChanged: (value) {
                setState(() {
                  to = value.toString();
                });
              },
            ),
            Text('LBP'),
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
          Navigator.of(context).push(
              MaterialPageRoute(builder:(context)=>const Page2())
          );
        }, style: ElevatedButton.styleFrom(
          primary: Colors.black,),
            child: const Text('Gold Prices')//Icon(Icons.navigate_next,size:50)
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



