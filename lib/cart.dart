import 'package:flutter/material.dart';
import 'package:shopping_app/order_successful.dart';

class CartPage extends StatelessWidget {
  final List productList;
  final List cartItems;
  final void Function(int) addToCart;
  final void Function(int) removeFromCart; 

  CartPage(this.productList, this.cartItems, this.addToCart, this.removeFromCart);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: size.width,
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Text(
            'CHECKOUT',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            height: size.height * .73,
            width: size.width,
            child: ListView.builder(
              itemCount: cartItems.length,
              itemBuilder: (context, index) {
                return cartPageCard(
                  size,
                  product_name: cartItems[index]['product_name'],
                  product_price: cartItems[index]['product_price'],
                  image: cartItems[index]['image'],
                  onDelete: () => removeFromCart(index), 
                );
              },
            ),
          ),
       
          ElevatedButton(onPressed: (){
           
            Navigator.push(context, MaterialPageRoute(builder: (_){
              return OrderSuccessScreen();
            }));
          }, child: Container(
            child: Text('CHECKOUT',
            textAlign: TextAlign.center, 
            style: TextStyle(
              fontSize: 17
            ),),
            width: size.width * .7,
            padding: EdgeInsets.symmetric(vertical: 10),
            ),
          ),
         ],
      ),
    );
  }

  Widget cartPageCard(
    Size size, {
    required String product_name,
    required String product_price,
    required String image,
    required VoidCallback onDelete, 
  }) {
    return Card(
      elevation: 5,
      child: Container(
        height: size.height * .18,
        width: size.width * .8,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          children: [
            Container(
              height: size.height * .18,
              width: size.width * .4,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(image),
                ),
              ),
            ),
            Container(
              width: size.width * .39,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    product_name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                  ),
                  Text(
                    product_price,
                    style: TextStyle(fontSize: 15),
                  ),
                  TextButton.icon(
                    onPressed: onDelete, 
                    icon: Icon(Icons.delete),
                    label: Text('Delete'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
