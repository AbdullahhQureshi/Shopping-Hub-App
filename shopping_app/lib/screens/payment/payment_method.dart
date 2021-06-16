import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/provider/auth.dart';
import 'package:shopping_app/screens/payment/payment_screen.dart';
import 'package:shopping_app/widget/progressdialogue.dart';

class PaymentMethod extends StatelessWidget {
  static const routeName="/paymentmethod";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Payment Selection"),
        backgroundColor: Colors.teal,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Padding(
              padding:
              EdgeInsets.symmetric(horizontal: 20, vertical: 10.0),
              child: FlatButton(
                padding: EdgeInsets.all(15),
                color: Colors.teal,
                onPressed: () async{
                 // Navigator.of(context).pushNamed(PaymentScreen.routeName);
                  showDialog(context: context,barrierDismissible: false,builder: (context)=>ProgressDialog(status: 'Loading...'),);
                 Map response1 = await (Provider.of<Auth>(context,listen: false).fetchJazzcashNumber());
                 List keys=[];
                 response1.forEach((key, value) {
                   keys.add(key);
                 });

                 String number = response1[keys[1]]['jazzcashNumber'];


                 Navigator.push(
                   context,
                   MaterialPageRoute(
                     builder: (context) => PaymentScreen(number: number,),
                   ),
                 );
                },
                child: Text(
                  'Jazzcash',
                  style: TextStyle(color: Colors.white, fontSize: 20.0),
                ),
              ),
            ),
            // Padding(
            //   padding:
            //   EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
            //   child: FlatButton(
            //     padding: EdgeInsets.all(15),
            //     color: Colors.teal,
            //     onPressed: (null) ,
            //     child: Text(
            //       'Add card',
            //       style: TextStyle(color: Colors.white, fontSize: 20.0),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
