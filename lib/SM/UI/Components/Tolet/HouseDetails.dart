import 'package:flutter/material.dart';


class HouseDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE7ECF0),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(Icons.arrow_back, color: Colors.black),
                  Spacer(),
                  Icon(Icons.bookmark_outline, color: Colors.black),
                ],
              ),
              SizedBox(height: 16),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  'https://via.placeholder.com/350x200',
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'CRAFTMAN HOUSE',
                          style: TextStyle(
                              fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            Icon(Icons.location_on, size: 16),
                            SizedBox(width: 4),
                            Text(
                              '350 Livingston Rd, Linden, New Jersey',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            _buildFeature(Icons.bed, '4 Beds'),
                            _buildFeature(Icons.bathtub, '3 Baths'),
                            _buildFeature(Icons.garage, '1 Garage'),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'In nature, forests are an ecosystem designed to provide nourishment and sustenance to all life forms. Abuzz with activity, forests are where all Read More',
                          style: TextStyle(color: Colors.grey[700]),
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://via.placeholder.com/150'),
                            ),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Rebecca Tetha',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Owner Craftsman House',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                            Spacer(),
                            Icon(Icons.phone, color: Colors.blue),
                          ],
                        ),
                        SizedBox(height: 16),
                        Text(
                          'Gallery',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 8),
                        Row(
                          children: [
                            _buildGalleryImage(),
                            _buildGalleryImage(),
                            _buildGalleryImage(),
                            _buildGalleryImage(),
                          ],
                        ),
                        SizedBox(height: 16),
                        Row(
                          children: [
                            Text(
                              'Price',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Spacer(),
                            Text(
                              '\$5,990/mo',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Text('BUY NOW'),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFeature(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.grey[700]),
        SizedBox(width: 4),
        Text(
          text,
          style: TextStyle(color: Colors.grey[700]),
        ),
        SizedBox(width: 16),
      ],
    );
  }

  Widget _buildGalleryImage() {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            'https://via.placeholder.com/100',
            height: 80,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
