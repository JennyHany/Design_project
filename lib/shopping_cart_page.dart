import 'package:flutter/material.dart';

import 'checkout_screen.dart';

class CartScreen extends StatefulWidget {
  @override
  _CartScreenState createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<Map<String, dynamic>> cartItems = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /*leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Go back
          },
        )*/
        title: cartItems.isEmpty ? null : const Text('Cart',style: TextStyle(fontWeight: FontWeight.bold),),
        actions: [
          if (cartItems.isNotEmpty)
            TextButton(
              onPressed: () {
                setState(() {
                  cartItems.clear();
                });
              },
              child:
              const Text('Remove All', style: TextStyle(color: Colors.red)),
            ),
        ],
      ),
      body: cartItems.isEmpty ? _buildEmptyCart() : _buildCartWithItems(),
    );
  }

  // Widget for empty cart
  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.shopping_bag_outlined,
            size: 120,
            color: Colors.amber,
          ),
          const SizedBox(height: 20),
          const Text(
            'Your Cart is Empty',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 35),
          ElevatedButton(
            onPressed: () {
              // Action to explore categories
              // For demo purposes, add items to cart
              setState(() {
                cartItems.add({
                  'title': 'Chicken Ranch Pizza',
                  'price': 148,
                  'size': 'M',
                });
                cartItems.add({
                  'title': 'Ashtota Lotus',
                  'price': 52,
                  'size': 'M',
                });
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
              child: Text('Explore Categories',
                  style: TextStyle(fontSize: 16, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }

  // Widget for cart with items
  Widget _buildCartWithItems() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            itemCount: cartItems.length,
            itemBuilder: (context, index) {
              final item = cartItems[index];
              return _cartItem(
                  item['title'], item['price'], item['size'], index);
            },
          ),
        ),
        _checkoutSection(),
      ],
    );
  }

  // Cart item widget
  Widget _cartItem(String title, int price, String size, int index) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          // Item image
          Container(
            width: 60,
            height: 60,
            color: Colors.grey[200],
            child: const Center(
                child: Text('Image')), // Placeholder for item image
          ),
          const SizedBox(width: 16),
          // Item details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: const TextStyle(fontWeight: FontWeight.bold)),
                Text('Size: $size'),
              ],
            ),
          ),
          // Item price and quantity controls
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text('EGP $price'),
              Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.remove_circle_outline,
                      color: Colors.deepPurple,
                    ),
                    onPressed: () {
                      // Decrease quantity or remove item
                      setState(() {
                        cartItems.removeAt(index);
                      });
                    },
                  ),
                  const Text('1'), // For simplicity, the quantity is set to 1
                  IconButton(
                    icon: const Icon(Icons.add_circle_outline,
                        color: Colors.deepPurple),
                    onPressed: () {
                      // Increase quantity action (optional)
                    },
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  // Checkout section widget
  Widget _checkoutSection() {
    double subtotal = cartItems.fold(0, (sum, item) => sum + item['price']);
    double shippingCost = 10.0;
    double total = subtotal + shippingCost;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Row(
            children: [Text('Payment summary',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),)],
          ),
          const SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Subtotal'),
              Text('EGP $subtotal'),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Shipping Cost'),
              Text('EGP $shippingCost'),
            ],
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text('Total',
                  style: TextStyle(fontWeight: FontWeight.bold)),
              Text('EGP $total',
                  style: const TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const SizedBox(height: 50),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutScreen(
                    subtotal: subtotal,
                    shippingCost: shippingCost,
                    total: total,
                  ),
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.symmetric(vertical: 15),
              child: Text('Checkout',
                  style: TextStyle(fontSize: 18, color: Colors.white)),
            ),
          ),
        ],
      ),
    );
  }
}
