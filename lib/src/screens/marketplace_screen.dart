import 'package:flutter/material.dart';
import '../models/product.dart';
import '../utils/constants.dart';
import '../widgets/action_button.dart';

class MarketplaceScreen extends StatefulWidget {
  const MarketplaceScreen({super.key});

  @override
  _MarketplaceScreenState createState() => _MarketplaceScreenState();
}

class _MarketplaceScreenState extends State<MarketplaceScreen> {
  final List<Product> _products = [
    Product(name: 'Wooden Chair', description: 'Good condition, 1 year old', price: 1500, seller: 'Amit'),
    Product(name: 'Dining Table', description: 'Glass top, slight scratches', price: 3000, seller: 'Priya'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Marketplace')),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppSizes.padding),
        itemCount: _products.length,
        itemBuilder: (context, index) {
          return _buildProductCard(context, _products[index]);
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addProduct,
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add),
      ),
    );
  }

  Widget _buildProductCard(BuildContext context, Product product) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppSizes.cardRadius)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(
              width: 80,
              height: 80,
              color: Colors.grey[300], // Placeholder for product image
              child: const Center(child: Icon(Icons.image, color: AppColors.grey)),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(product.description, style: const TextStyle(color: AppColors.grey)),
                  const SizedBox(height: 4),
                  Text('₹${product.price}', style: const TextStyle(fontSize: 16, color: AppColors.blue)),
                  const SizedBox(height: 4),
                  Text('Seller: ${product.seller}', style: const TextStyle(color: AppColors.grey)),
                ],
              ),
            ),
            ActionButton(
              text: 'Contact',
              onPressed: () => _contactSeller(context, product.seller),
            ),
          ],
        ),
      ),
    );
  }

  void _contactSeller(BuildContext context, String seller) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Contacting $seller...')));
  }

  void _addProduct() {
    // Placeholder for adding a product (could open a form in a real app)
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Add product feature coming soon!')));
  }
}