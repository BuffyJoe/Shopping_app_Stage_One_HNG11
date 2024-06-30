import 'package:flutter/material.dart';

class ProductsPage extends StatelessWidget {
  final List productList;
  final List cartItems;
  final void Function(int) addToCart; 

  ProductsPage(this.productList, this.cartItems, this.addToCart);

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
            'Our Products',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            height: size.height * .8,
            width: size.width,
            child: ListView.builder(
              itemCount: productList.length,
              itemBuilder: (context, index) {
                return productPageCard(
                  size,
                  product_name: productList[index]['product_name'],
                  product_price: productList[index]['product_price'],
                  image: productList[index]['image'],
                  onAddToCart: () => addToCart(index),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget productPageCard(
    Size size, {
    required String product_name,
    required String product_price,
    required String image,
    required VoidCallback onAddToCart,
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
                    onPressed: onAddToCart,
                    icon: Icon(Icons.add_shopping_cart),
                    label: Text('Add to Cart'),
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
