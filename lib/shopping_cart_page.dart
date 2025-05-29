import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'checkout_screen.dart';
import 'main.dart'; 
import 'profile_page.dart';
import 'cart_provider.dart'; 

class CartScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'My Cart',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Consumer<CartProvider>(
            builder: (context, cartProvider, child) {
              if (cartProvider.items.isNotEmpty) {
                return IconButton(
                  icon: const Icon(Icons.delete_outline, color: Colors.redAccent),
                  tooltip: 'Clear Cart',
                  onPressed: () {
                    // Show a confirmation dialog before clearing the cart
                    _showClearCartConfirmation(context, cartProvider);
                  },
                );
              }
              return const SizedBox.shrink(); // Hide button if cart is empty
            },
          ),
        ],
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          if (cartProvider.items.isEmpty) {
            return _buildEmptyCart(context);
          } else {
            return _buildCartContent(context, cartProvider);
          }
        },
      ),
      bottomNavigationBar: _buildBottomNavigationBar(context),
    );
  }

  Widget _buildEmptyCart(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(
          height: 45,
        ),
        Center(
          child: Image.asset(
            'assets/search bar.jpg', // Replace with your actual image asset
            width: 400,
          ),
        ),
        const Text(
          'Ouch! Hungry?',
          style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        const Text(
          'Seems like you have not ordered\nany food yet',
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 17, color: Colors.grey),
        ),
        const SizedBox(height: 40),
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => FoodHomePage()), 
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xff8E22D2),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          ),
          child: const Text(
            'Find Foods',
            style: TextStyle(fontSize: 20, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget _buildCartContent(BuildContext context, CartProvider cartProvider) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16.0),
            itemCount: cartProvider.items.length,
            itemBuilder: (context, index) {
              final cartItem = cartProvider.items[index];
              return _buildCartItemCard(context, cartItem, cartProvider);
            },
          ),
        ),
        _buildCheckoutSection(context, cartProvider),
      ],
    );
  }

  Widget _buildCartItemCard(BuildContext context, CartItem item, CartProvider cartProvider) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                item.imageUrl, 
                height: 70,
                width: 70,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) =>
                const Icon(Icons.fastfood, size: 70, color: Colors.grey), 
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '\$${item.price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(Icons.remove_circle, color: Colors.deepPurple.shade400),
                  onPressed: () {
                    cartProvider.removeItem(item.name);
                  },
                  visualDensity: VisualDensity.compact,
                ),
                Text(
                  '${item.quantity}',
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  icon: Icon(Icons.add_circle, color: Colors.deepPurple.shade400),
                  onPressed: () {
                    cartProvider.addItem(item.name, item.price, item.imageUrl);
                  },
                  visualDensity: VisualDensity.compact,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildCheckoutSection(BuildContext context, CartProvider cartProvider) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, -3),
          ),
        ],
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Total:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                '\$${cartProvider.totalPrice.toStringAsFixed(2)}',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.deepPurple,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CheckoutPage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff8E22D2),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              child: const Text(
                'Proceed to Checkout',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }


  Future<void> _showClearCartConfirmation(BuildContext context, CartProvider cartProvider) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // User must tap button!
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: const Text('Clear Cart'),
          content: const Text('Are you sure you want to clear your cart? This action cannot be undone.'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () {
                Navigator.of(dialogContext).pop(); // Dismiss dialog
              },
            ),
            TextButton(
              child: const Text('Clear', style: TextStyle(color: Colors.red)),
              onPressed: () {
                cartProvider.clearCart(); // Clear the cart
                Navigator.of(dialogContext).pop(); // Dismiss dialog
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('Cart cleared!')),
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 1, // Set the active tab to Cart (index 1)
      selectedItemColor: const Color(0xff8E22D2), // Changed to match your button color
      unselectedItemColor: Colors.grey,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      onTap: (index) {
        if (index == 0) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => FoodHomePage()), 
          );
        } else if (index == 2) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => ProfilePage()),
          );
        }
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_outlined),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.shopping_bag), 
          label: 'Cart',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.chat_bubble_outline),
          label: 'Chat',
        ),
      ],
    );
  }
}
