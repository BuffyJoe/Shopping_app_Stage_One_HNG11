import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final List productList;
   HomePage(this.productList);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
            height: size.height,
            width: size.width,
          child: SingleChildScrollView(
            child: Column(
              children: [
                spacer(size.height * .04),
                welcomeCard(size),
                spacer(size.height * .05),
                Text('Trending Products', 
                    style: TextStyle(
                      fontWeight: FontWeight.bold, 
                      fontSize: 22,
                      ),
                    ),
               Container(
                  width: size.width * .95,
                  height: size.height * .32,
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: productList.length, // Replace with your actual item count
                    itemBuilder: (context, index) {
                      return productCard(
                        size, 
                        product_name: productList[index]['product_name'],
                        product_price: productList[index]['product_price'],
                        image: productList[index]['image']
                        );
                    },
                  ),
                ),
                spacer(size.height * .03),
                Center(
                  child: Card(
                    elevation: 5,
                    child: Container(
                      height: size.height * .4,
                      width: size.width * .8,
                      decoration: BoxDecoration(image: DecorationImage(image: AssetImage('assets/images/5.JPG'))),
                    child: Center(
                      child: Text(
                        'BUY EVERYTHING YOU NEED TO KEEP YOUR STOMACH FULL AND YOURSELF HEALTHY',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          backgroundColor: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                        ),),
                    ),
                    ),
                  ),
                ),
                spacer(size.height * .05)
    
                ], //end of main column
            ),
          ),
        )
      ;
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
                  height: size.height * .27,
                  width: size.width * .4,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        Container(
                          width: size.width * .39, 
                          height: size.height * .2, 
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
                         
],
                    ),
                ),
              );
            }
}