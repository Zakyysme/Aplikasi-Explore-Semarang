import 'package:flutter/material.dart';

class Katalog extends StatefulWidget {
  const Katalog({super.key});

  @override
  State<Katalog> createState() => _KatalogState();
}

class _KatalogState extends State<Katalog> {
  final List<String> categories = ['All', 'Kuliner', 'Wisata', 'Nongkrong'];

  String selectedCategory = 'All';

  final List<String> imageList = [
    'images/bg.jpg',
    'images/bg-2.png',
    'images/bg-3.jpg',
    'images/bg-4.png',
  ];

  final List<Map<String, String>> items = [
    {
      'image': 'images/food1.jpg',
      'name': 'Mie Goreng',
      'description': 'Mie goreng khas Jawa',
      'price': 'Rp 15.000',
      'category': 'Kuliner',
    },
    {
      'image': 'images/food2.jpg',
      'name': 'Sate Ayam',
      'description': 'Sate ayam dengan bumbu kacang',
      'price': 'Rp 20.000',
      'category': 'Kuliner',
    },
    {
      'image': 'images/req1.jpg',
      'name': 'Pantai Indah',
      'description': 'Pantai dengan pasir putih',
      'price': 'Rp 50.000',
      'category': 'Wisata',
    },
    {
      'image': 'images/img-1.jpg',
      'name': 'Cafe Cozy',
      'description': 'Tempat nongkrong nyaman',
      'price': 'Rp 25.000',
      'category': 'Nongkrong',
    },
    {
      'image': 'images/req2.jpg',
      'name': 'Gunung Sejuk',
      'description': 'Pemandangan gunung yang indah',
      'price': 'Rp 100.000',
      'category': 'Wisata',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filteredItems = selectedCategory == 'All'
        ? items
        : items.where((item) => item['category'] == selectedCategory).toList();

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // Dropdown untuk kategori
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: DropdownButton<String>(
                value: selectedCategory,
                isExpanded: true,
                items: categories.map((category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedCategory = value!;
                  });
                },
              ),
            ),
          ),

          // GridView untuk menampilkan item
          SliverGrid(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final item = filteredItems[index];
                return Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  elevation: 4,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Gambar
                      ClipRRect(
                        borderRadius: const BorderRadius.vertical(
                            top: Radius.circular(16)),
                        child: Image.asset(
                          item['image']!,
                          height: 120,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      ),
                      // Nama
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item['name']!,
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                      // Deskripsi
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Text(
                          item['description']!,
                          style: const TextStyle(fontSize: 14),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      // Harga
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          item['price']!,
                          style: const TextStyle(
                              fontSize: 14, color: Colors.green),
                        ),
                      ),
                    ],
                  ),
                );
              },
              childCount: filteredItems.length,
            ),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Jumlah kolom
              mainAxisSpacing: 8.0, // Jarak antar baris
              crossAxisSpacing: 8.0, // Jarak antar kolom
              childAspectRatio: 0.75, // Rasio item
            ),
          ),
        ],
      ),
    );
  }
}
