import 'package:flutter/material.dart';
import 'package:shopping_app/cart.dart';
import 'package:shopping_app/home.dart';
import 'package:shopping_app/products.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
   MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var currentIndex = 0;
  List cartItems = [];

  List productList = [
    {
      'product_name' : 'Plantain Chips',
      'product_price' : '2,000',
      'image' : 'assets/images/1.JPG',
      },
      {
      'product_name' : 'Plantain Flour',
      'product_price' : '2,900',
      'image' : 'assets/images/2.JPG',
      },
      {
      'product_name' : 'Plantain Chips',
      'product_price' : '4,000',
      'image' : 'assets/images/3.JPG',
      },
      {
      'product_name' : 'Chin Chin',
      'product_price' : '3,000',
      'image' : 'assets/images/4.JPG',
      },
      {
      'product_name' : 'Kuli Kuli',
      'product_price' : '2,450',
      'image' : 'assets/images/5.JPG',
      },
      {
      'product_name' : 'Kuli Kuli',
      'product_price' : '1,000',
      'image' : 'assets/images/6.JPG',
      },
  ];
  void addToCart(int index) {
  setState(() {
    cartItems.add(productList[index]);
  });
  print(cartItems.first);
}

  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          onTap: (int index){
            currentIndex = index;
            setState(() {
              currentIndex;
            });
    
          },
          items: [
             BottomNavigationBarItem(
            icon: Icon(Icons.home), 
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shop), 
            label: 'Products',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_checkout), 
            label: 'cart',
          ),
    
        ],
        elevation: 0,
        ),
        backgroundColor: Colors.white,
        body: currentIndex == 0 
  ? HomePage(productList) 
  : currentIndex == 1 
    ? ProductsPage(productList, cartItems, addToCart) 
    : CartPage(productList, cartItems, addToCart, removeFromCart),
),
    );

    }

    Widget spacer (double height){
      return Container(
        height: height,
      );
  }

  Widget welcomeCard(Size size){
         return Card(
                elevation: 5,
                child: Container(
                  height: size.height * .32,
                  width: size.width *.9,
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child:const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Welcome to my Stage One Mobile Development Task', 
                        textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white, 
                      fontSize: 35,
                      ),
                      ),
                      Text('i paid for premium, but i am yet to be added to the premium workspace', 
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontStyle: FontStyle.italic,
                            fontSize: 10
                            ),
                        ),
                    ],
                      
                  ),
                ),
              );
          
  }

  Widget productCard(
    Size size, 
    {
      required String product_name,
      required String product_price,
      required String image,
      }){
      return Card(
                child: Container(
                  height: size.height * .3,
                  width: size.width * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: size.width * .39, 
                          height: size.height * .17, 
                          decoration: BoxDecoration(
                            
                            image: DecorationImage(
                              image: AssetImage(image), 
                              fit: BoxFit.fill, 
                            ),
                            ),
                          ),
                          Text(product_name, 
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18
                          ),
                          ),
                          Text(product_price,                           style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,),),
                          TextButton.icon(
                            onPressed: () {
                            },
                            icon: Icon(Icons.add_shopping_cart),
                            label: Text('Add to Cart'),
                            ),
],
                    ),
                ),
              );
            }
}