import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/product.dart';
import '../widgets/product_card.dart';
import '../widgets/hot_offer_item.dart';

class ShoppingHomeScreen extends StatelessWidget {
  final Function(Locale) onLanguageChanged;
  final Locale currentLocale;
  
  const ShoppingHomeScreen({
    super.key,
    required this.onLanguageChanged,
    required this.currentLocale,
  });

  @override
  Widget build(BuildContext context) {
    final localizations = AppLocalizations.of(context)!;

    final products = [
      Product(
        id: '1',
        title: 'Wireless Headphones',
        imageUrl: 'https://images.unsplash.com/photo-1505740420928-5e560c06d30e',
        price: 99.99,
      ),
      Product(
        id: '2',
        title: 'Smart Watch',
        imageUrl: 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
        price: 199.99,
      ),
      Product(
        id: '3',
        title: 'Camera',
        imageUrl: 'https://images.unsplash.com/photo-1526170375885-4d8ecf77b99f',
        price: 499.99,
      ),
      Product(
        id: '4',
        title: 'Laptop',
        imageUrl: 'https://images.unsplash.com/photo-1496181133206-80ce9b88a853',
        price: 1299.99,
      ),
      Product(
        id: '5',
        title: 'Sunglasses',
        imageUrl: 'https://images.unsplash.com/photo-1572635196237-14b3f281503f',
        price: 149.99,
      ),
      Product(
        id: '6',
        title: 'Sneakers',
        imageUrl: 'https://images.unsplash.com/photo-1542291026-7eec264c27ff',
        price: 129.99,
      ),
    ];

    final featuredImages = [
      'https://images.unsplash.com/photo-1607082348824-0a96f2a4b9da',
      'https://images.unsplash.com/photo-1607082349566-187342175e2f',
      'https://images.unsplash.com/photo-1441986300917-64674bd600d8',
    ];

    final hotOffers = [
      {
        'image': 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d',
        'description': '50% Off on Electronics',
      },
      {
        'image': 'https://images.unsplash.com/photo-1534452203293-494d7ddbf7e0',
        'description': 'Buy 2 Get 1 Free on Fashion',
      },
      {
        'image': 'https://images.unsplash.com/photo-1560343090-f0409e92791a',
        'description': 'Free Shipping on Orders Over \$50',
      },
      {
        'image': 'https://images.unsplash.com/photo-1491553895911-0055eca6402d',
        'description': 'Limited Time: Summer Sale',
      },
      {
        'image': 'https://images.unsplash.com/photo-1523275335684-37898b6baf30',
        'description': 'New Arrivals - Check Now!',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text(localizations.ourProducts),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            icon: const Icon(Icons.language, color: Colors.white),
            onPressed: () {
              _showLanguageDialog(context);
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: PageView.builder(
                itemCount: featuredImages.length,
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      image: DecorationImage(
                        image: NetworkImage(featuredImages[index]),
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: products.length,
                itemBuilder: (context, index) {
                  return ProductCard(product: products[index]);
                },
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                localizations.hotOffers,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ),
            const SizedBox(height: 8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: hotOffers.length,
              itemBuilder: (context, index) {
                return HotOfferItem(
                  imageUrl: hotOffers[index]['image']!,
                  description: hotOffers[index]['description']!,
                );
              },
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }

  void _showLanguageDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Select Language / اختر اللغة'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Text('🇺🇸'),
                title: const Text('English'),
                onTap: () {
                  Navigator.of(context).pop();
                  onLanguageChanged(const Locale('en'));
                },
              ),
              ListTile(
                leading: const Text('🇸🇦'),
                title: const Text('العربية'),
                onTap: () {
                  Navigator.of(context).pop();
                  onLanguageChanged(const Locale('ar'));
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
