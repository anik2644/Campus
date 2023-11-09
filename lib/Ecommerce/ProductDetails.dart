import 'package:flutter/material.dart';

class ProductDetailsPage extends StatelessWidget {

  late int index ;
  ProductDetailsPage(int i)
  {
    index = i;
  }
  List<Product> p = [
    Product(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Runny_hunny.jpg/800px-Runny_hunny.jpg', name: 'Honey', price: 19,),
    Product(image: 'https://www.tasteofhome.com/wp-content/uploads/2023/01/GettyImages-1293654951-e1674252263498.jpg', name: 'Date', price: 11,),
    Product(image: 'https://www.heart.org/-/media/AHA/Recipe/Article-Images/nuts.jpg', name: 'Nut', price: 23,),

  ];
  //Product product =  p.first;
  // Product(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Runny_hunny.jpg/800px-Runny_hunny.jpg', name: 'Honey', price: 19,);


//  Product product =  Product(image: 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/cc/Runny_hunny.jpg/800px-RunnPr

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 300,
              child: Image.network(
                p[index].image,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                p[index].name,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                p[index].name,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Price: \$${ p[index].price.toStringAsFixed(2)}',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                onPressed: () {
                  // Add to cart action
                  print('Product added to cart: ${ p[index].name}');
                },
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  onPrimary: Colors.white,
                ),
                child: Text('Add to Cart'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Product {
  final String image;
  final String name;
  final int price;

  const Product({
    required this.image,
    required this.name,
    required this.price,
  });

}
