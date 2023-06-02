import 'package:flutter/material.dart';

import 'ProductDetails.dart';

class EcommerceApp extends StatefulWidget {
  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecommerce App'),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              // Search action
            },
          ),
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {
              // Cart action
            },
          ),
        ],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          SizedBox(height: 16),
          Text(
            'Featured Products',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),


          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>ProductDetailsPage(0)// Landing(),//SecondaryHomepage()
                  ));
            },
            child: ProductItem(
              image: 'https://www.thespruceeats.com/thmb/SyP3bufEFJxkExFqz7__yrsEkSo=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/honey-dripping-off-a-honey-spoon-into-a-glass-bowl-545879087-5810c8ca5f9b58564c296ca7.jpg',
              name: 'Honey',
              price: '19.99',
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>ProductDetailsPage(1)// Landing(),//SecondaryHomepage()
                  ));
            },
            child: ProductItem(
              image: 'https://www.mashed.com/img/gallery/what-are-dates-and-how-do-you-eat-them/l-intro-1633544971.jpg',
              name: 'Date',
              price: '29.99',
            ),
          ),
          SizedBox(height: 16),
          GestureDetector(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) =>ProductDetailsPage(2)// Landing(),//SecondaryHomepage()
                  ));
            },
            child: ProductItem(
              image: 'https://media.istockphoto.com/id/496689738/photo/assorted-nuts.jpg?s=612x612&w=0&k=20&c=lJhqPaHqwvXiDFNni5nB9EKgvYlqMEljI-0JzaB-ZNA=',
              name: 'Nut',
              price: '39.99',
            ),
          ),
          SizedBox(height: 16),
          // ProductItem(
          //   image: 'assets/product4.jpg',
          //   name: 'Product 4',
          //   price: '49.99',
          // ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    )
    ;
  }
}

class ProductItem extends StatelessWidget {
  final String image;
  final String name;
  final String price;

  const ProductItem({
    required this.image,
    required this.name,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 3,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
              child: Image.network(
                image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Padding(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    '\$$price',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[700],
                    ),
                  ),
                  Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      // Add to cart action
                    },
                    child: Text('Add to Cart'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
