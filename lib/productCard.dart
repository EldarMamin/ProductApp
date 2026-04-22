import 'package:flutter/material.dart';
import 'package:lesson_2/productApp.dart';
import 'constants.dart';

class ProductCard extends StatelessWidget {
  final String image;
  final String title;
  final String price;
  final bool sale;
  final String category;
  final int rating;

  ProductCard({
    required this.image,
    required this.title,
    required this.price,
    required this.category,
    required this.rating,
    this.sale = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 8),
      padding: EdgeInsets.all(paddingSize),
      decoration: BoxDecoration(
        color: Color(0xFFFFFDD0),
        borderRadius: BorderRadius.circular(cardRadius),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // -------- STACK: картинка + SALE badge -------------
          Stack(
            // наложение одно на другого, первый элемент в чилдрен в самом низу
            children: [
              ClipRRect(
                // Прямоугольник с округленными углами
                borderRadius: BorderRadius.circular(40),
                child: Image.asset(
                  image,
                  height: imageHeight,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: imageHeight,
                    color: Colors.red,
                    child: Center(child: Text('Ошибка')),
                  ),
                ),
              ),
              // Плашка SALE
              if (sale)
                Positioned(
                  top: 8,
                  left: 8,
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      "SALE",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
            ],
          ),

          SizedBox(height: 10),

          // -------- Название + цена (Flexible + Spacer) -------
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 12),
            child: Row(
              children: [
                Flexible(
                  //Title
                  child: Text(
                    title,
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.visible,
                    softWrap: true,
                  ),
                ),
                
                Spacer(),

                Text(
                  //Price
                  price,
                  style: TextStyle(
                    fontSize: 14,
                    color: priceColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 8),

          // Category
          Align(
            alignment: Alignment.center,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.blue,
                padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                child: Text(
                  category,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),

          SizedBox(height: 8),

          // Rating
          Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(5, (index) {
              return Icon(
                index < rating ? Icons.star : Icons.star_border,
                size: 16,
                color: Colors.amber,
              );
            }),
          ),

          SizedBox(height: 8),

          // Buy button
          Align(
            alignment: Alignment.bottomCenter,
            child: ElevatedButton(onPressed: () {}, child: Text('Купить')),
          ),

          SizedBox(height: 8),

          // Избранное Button
          Align(
            alignment: Alignment.bottomCenter,
            child: OutlinedButton(onPressed: () {}, child: Text('В избранное')),
          ),
        ],
      ),
    );
  }
}
