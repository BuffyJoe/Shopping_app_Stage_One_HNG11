import 'package:flutter/material.dart';
import 'package:shopping_app/main.dart';

class OrderSuccessScreen extends StatelessWidget {
  

  const OrderSuccessScreen();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            SizedBox(height: 20),
            Text(
              'Thank you for your order!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
          
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (_){
                  return MyHomePage();
                }), (route) => false);
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
