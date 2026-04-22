import 'package:flutter/material.dart';
import 'package:lesson_2/productCard.dart';
import 'constants.dart';

class ProductApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Товары'),
          centerTitle: true,
          backgroundColor: Colors.amber,
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(child: ProductCard(
                    image: 'images/boots.jpg', 
                    title: 'Nike Air Max', 
                    price: '250\$',
                    sale: true,
                    category: 'Обувь',
                    rating: 2,
                    ),
                  ),
                  
                  SizedBox(width: 10),

                  Expanded(child: ProductCard(
                    image: 'images/clock.jpg', 
                    title: 'AirWatch', 
                    price: '350\$',
                    sale: false,
                    category: 'Техника',
                    rating: 4,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
