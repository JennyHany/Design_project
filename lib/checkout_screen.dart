import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart'; 
import 'main.dart'; 

class CheckoutPage extends StatefulWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  _CheckoutPageState createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPaymentMethod = 'Credit Card';
  String _address = '';

  // Define a fixed shipping cost
  final double _fixedShippingCost = 5.00; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Checkout',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xff8E22D2), // Consistent app bar color
        iconTheme: const IconThemeData(color: Colors.white), // Back button color
      ),
      body: Consumer<CartProvider>(
        builder: (context, cartProvider, child) {
          final subtotal = cartProvider.totalPrice;
          final total = subtotal + _fixedShippingCost;

          if (cartProvider.items.isEmpty) {
            // Handle case where cart becomes empty while on checkout page
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                    const SizedBox(height: 20),
                    const Text(
                      'Your cart is empty. Please add items to proceed to checkout.',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18, color: Colors.grey),
                    ),
                    const SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.popUntil(context, (route) => route.isFirst); // Go back to home
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xff8E22D2),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      ),
                      child: const Text(
                        'Go to Home',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                padding: EdgeInsets.only(
                  left: 16.0,
                  right: 16.0,
                  top: 16.0,
                  bottom: MediaQuery.of(context).viewInsets.bottom + 16.0,
                ),
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Order Summary Section
                        _buildSectionTitle('Order Summary'),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: cartProvider.items.map((item) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Text(
                                          '${item.name} x${item.quantity}',
                                          style: const TextStyle(fontSize: 15, color: Colors.black87),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                      Text(
                                        '\$ ${(item.price * item.quantity).toStringAsFixed(2)}',
                                        style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Payment Summary Section
                        _buildSectionTitle('Payment Details'),
                        const SizedBox(height: 10),
                        Card(
                          elevation: 2,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                _buildSummaryRow('Subtotal', subtotal),
                                _buildSummaryRow('Shipping Cost', _fixedShippingCost),
                                const Divider(height: 20, thickness: 1),
                                _buildSummaryRow('Total', total, isTotal: true),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Address Input Field
                        _buildSectionTitle('Shipping Address'),
                        const SizedBox(height: 8),
                        TextFormField(
                          decoration: InputDecoration(
                            hintText: 'Enter your shipping address',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xff8E22D2), width: 2),
                            ),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _address = value;
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your shipping address';
                            }
                            return null;
                          },
                          maxLines: 3, // Allow multiple lines for address
                        ),
                        const SizedBox(height: 24),

                        // Payment Method Dropdown
                        _buildSectionTitle('Payment Method'),
                        const SizedBox(height: 8),
                        DropdownButtonFormField<String>(
                          value: _selectedPaymentMethod,
                          items: ['Credit Card', 'Cash', 'InstaPay']
                              .map((method) => DropdownMenuItem(
                            value: method,
                            child: Text(method),
                          ))
                              .toList(),
                          onChanged: (value) {
                            setState(() {
                              _selectedPaymentMethod = value!;
                            });
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(12),
                              borderSide: const BorderSide(color: Color(0xff8E22D2), width: 2),
                            ),
                          ),
                        ),
                        const SizedBox(height: 45),

                        // Confirm Payment Button
                        ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _processPayment(context, cartProvider);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff8E22D2),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                          ),
                          child: const Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
                            child: Text('Confirm Payment',
                                style:
                                TextStyle(fontSize: 18, color: Colors.white)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.deepPurple),
    );
  }

  Widget _buildSummaryRow(String label, double amount, {bool isTotal = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.black : Colors.grey[800],
            ),
          ),
          Text(
            '\$${amount.toStringAsFixed(2)}',
            style: TextStyle(
              fontSize: isTotal ? 18 : 16,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
              color: isTotal ? Colors.deepPurple : Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  void _processPayment(BuildContext context, CartProvider cartProvider) {
   
    showDialog(
      context: context,
      barrierDismissible: false, // User must tap button
      builder: (context) => AlertDialog(
        title: const Text('Order Confirmed!', style: TextStyle(color: Colors.green)),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Your order has been placed successfully!'),
            const SizedBox(height: 10),
            Text('Shipping to: $_address'),
            Text('Payment via: $_selectedPaymentMethod'),
            Text('Total Paid: \$ ${(cartProvider.totalPrice + _fixedShippingCost).toStringAsFixed(2)}'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              cartProvider.clearCart(); // Clear the cart after successful order
              Navigator.of(context).pop(); // Dismiss the dialog
              // Navigate back to the home page or an order confirmation page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => FoodHomePage()), // Or FoodListingPage()
                    (Route<dynamic> route) => false, // This predicate ensures all previous routes are removed
              );
            },
            child: const Text('OK', style: TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}
