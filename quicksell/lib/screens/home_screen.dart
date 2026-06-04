import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final _searchController = TextEditingController();
  String _searchText = '';

  final List<Map<String, String>> _demoProducts = [
    {
      'name': 'Fresh Tomatoes',
      'price': '5',
      'description': 'Fresh local tomatoes, 1kg',
      'seller': 'Kidist',
      'image': 'https://images.unsplash.com/photo-1546094096-0df4bcabd337?w=400',
    },
    {
      'name': 'Flutter Textbook',
      'price': '15',
      'description': 'Used programming book, good condition',
      'seller': 'Yohannes',
      'image': 'https://images.unsplash.com/photo-1544716278-ca5e3f4abd8c?w=400',
    },
    {
      'name': 'Samsung Earphones',
      'price': '20',
      'description': 'Original Samsung earphones, barely used',
      'seller': 'Abebe',
      'image': 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e?w=400',
    },
    {
      'name': 'School Bag',
      'price': '12',
      'description': 'Black school bag, good condition',
      'seller': 'Sara',
      'image': 'https://images.unsplash.com/photo-1553062407-98eeb64c6a62?w=400',
    },
    {
      'name': 'Fresh Eggs',
      'price': '3',
      'description': 'Farm fresh eggs, 12 pieces',
      'seller': 'Meron',
      'image': 'https://images.unsplash.com/photo-1582722872445-44dc5f7e3c8f?w=400',
    },
    {
      'name': 'Wooden Chair',
      'price': '25',
      'description': 'Solid wooden chair, good for office',
      'seller': 'Dawit',
      'image': 'https://images.unsplash.com/photo-1581428982868-e410dd047a90?w=400',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final filtered = _demoProducts.where((p) =>
        p['name']!.toLowerCase().contains(_searchText)).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: const Text('QuickSell',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout, color: Colors.white),
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) =>
                  setState(() => _searchText = value.toLowerCase()),
              decoration: InputDecoration(
                hintText: 'Search products...',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12)),
                filled: true,
                fillColor: Colors.grey[100],
              ),
            ),
          ),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.75,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: filtered.length,
              itemBuilder: (context, index) {
                final product = filtered[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/demo-chat',
                        arguments: product);
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          child: ClipRRect(
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(12)),
                            child: Image.network(
                              product['image']!,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                color: Colors.orange[100],
                                child: const Icon(Icons.image,
                                    size: 60, color: Colors.orange),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(product['name']!,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8.0, vertical: 4),
                          child: Text('\$${product['price']}',
                              style: const TextStyle(
                                  color: Colors.orange,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        onPressed: () => Navigator.pushNamed(context, '/add-product'),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}