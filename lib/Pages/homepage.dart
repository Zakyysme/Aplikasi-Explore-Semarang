import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:projectflutter/Pages/katalog.dart';
// import 'package:projectflutter/Pages/profil.dart';
// import 'package:stylish_bottom_bar/stylish_bottom_bar.dart';

class HomePage extends StatefulWidget {
   const HomePage({super.key});

   @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final List<String> imageList = [
    'images/bg.jpg',
    'images/bg-2.png',
    'images/bg-3.jpg',
    'images/bg-4.png',
  ];

  final List<Map<String, String>> recommendations = [
    {
      'image': 'images/img-1.jpg',
      'title': 'Cafe 1',
      'harga': 'Deskripsi singkat rekomendasi 1'
    },
    {
      'image': 'images/img-1-1.jpg',
      'title': 'Cafe 2',
      'harga': 'Deskripsi singkat rekomendasi 2'
    },
    {
      'image': 'images/img-1-2.jpg',
      'title': 'Cafe 3',
      'harga': 'Deskripsi singkat rekomendasi 3'
    },
    {
      'image': 'images/img-1-3.jpg',
      'title': 'Cafe 4',
      'harga': 'Deskripsi singkat rekomendasi 4'
    },
    {
      'image': 'images/img-2-1.jpg',
      'title': 'Cafe 5',
      'harga': 'Deskripsi singkat rekomendasi 4'
    },
    {
      'image': 'images/img-2-2.jpg',
      'title': 'Cafe 6',
      'harga': 'Deskripsi singkat rekomendasi 4'
    },
  ];


  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Slider dengan Border Radius
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  viewportFraction: 0.9,
                  aspectRatio: 16 / 9,
                  autoPlayInterval: const Duration(seconds: 3),
                ),
                items: imageList.map((imagePath) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(imagePath),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          // Layanan
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Menu',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildFeatureCard('images/kuliner.png', 'Kuliner'),
                    _buildFeatureCard('images/nongkrong.png', 'Tempat Nongkrong'),
                    _buildFeatureCard('images/transportasi.png', 'Transportasi'),
                    _buildFeatureCard('images/wisata.png', 'Tempat Wisata'),
                  ],
                ),
              ],
            ),
          ),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            const Text(
              'Rekomendasi tempat wisata',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          TextButton(
                    onPressed: () {
                      // Navigate to the new page when clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Katalog(),
                        ),
                      );
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
        ],
        
      ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 270, // Tinggi card slider
              enableInfiniteScroll: false, // Tidak loop otomatis
              enlargeCenterPage: true, // Card di tengah lebih besar
              viewportFraction: 0.8, // Fraksi card yang terlihat
              autoPlay: false, // Slider tidak otomatis
            ),
            items: recommendations.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            item['image']!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['title']!,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item['harga']!,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 50),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            const Text(
              'Rekomendasi Tempat Nongkrong',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          TextButton(
                    onPressed: () {
                      // Navigate to the new page when clicked
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const Katalog(),
                        ),
                      );
                    },
                    child: const Text(
                      'View All',
                      style: TextStyle(fontSize: 16, color: Colors.blue),
                    ),
                  ),
        ],
        
      ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 270, // Tinggi card slider
              enableInfiniteScroll: false, // Tidak loop otomatis
              enlargeCenterPage: true, // Card di tengah lebih besar
              viewportFraction: 0.8, // Fraksi card yang terlihat
              autoPlay: false, // Slider tidak otomatis
            ),
            items: recommendations.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 5,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                          child: Image.asset(
                            item['image']!,
                            height: 150,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            item['title']!,
                            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            item['harga']!,
                            style: const TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }).toList(),
          ),
          const SizedBox(height: 50),
        ],
      ),
      );
  }

  Widget _buildFeatureCard(String imagePath, String title) {
    return Column(
      children: [
        CircleAvatar(
          radius: 30,
          child: Image.asset(
          imagePath,
          height: 30,
          width: 30,
        ),
        ),
        // const SizedBox(height: 10),
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
  
}
