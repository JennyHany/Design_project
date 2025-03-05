import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CardsPage extends StatefulWidget {
  @override
  _CardsPageState createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  // Controllers for TextFields
  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _nameOnCardController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _securityCodeController = TextEditingController();

  // Focus nodes for TextFields
  final FocusNode _cardNumberFocus = FocusNode();
  final FocusNode _nameOnCardFocus = FocusNode();
  final FocusNode _expiryDateFocus = FocusNode();
  final FocusNode _securityCodeFocus = FocusNode();

  @override
  void dispose() {
    // Dispose controllers and focus nodes to avoid memory leaks
    _cardNumberController.dispose();
    _nameOnCardController.dispose();
    _expiryDateController.dispose();
    _securityCodeController.dispose();
    _cardNumberFocus.dispose();
    _nameOnCardFocus.dispose();
    _expiryDateFocus.dispose();
    _securityCodeFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(color: Color(0xFF0B021B)),
        child: Stack(
          children: [
            // Back Arrow
            Positioned(
              left: 16,
              top: 40,
              child: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.white),
                onPressed: () {
                  Navigator.pop(context); // Navigate back to the previous page
                },
              ),
            ),

            // Card Image
            Positioned(
              left: 5,
              top: 70,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 316,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/card.PNG"), // Use local image
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            // Card Number Field
            Positioned(
              left: 24,
              top: 420,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_cardNumberFocus);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xE02D2E2E),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _cardNumberController,
                      focusNode: _cardNumberFocus,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Card Number',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Only numbers
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Name on Card Field
            Positioned(
              left: 24,
              top: 520,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_nameOnCardFocus);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width - 48,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF2D2F2F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _nameOnCardController,
                      focusNode: _nameOnCardFocus,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Name on Card',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]')), // Only letters
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Expiry Date Field
            Positioned(
              left: 24,
              top: 615,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_expiryDateFocus);
                },
                child: Container(
                  width: 133,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF2D2F2F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _expiryDateController,
                      focusNode: _expiryDateFocus,
                      keyboardType: TextInputType.datetime,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'MM/YY',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Only numbers
                        LengthLimitingTextInputFormatter(4), // Limit to 4 digits
                        CardExpiryInputFormatter(), // Custom formatter for MM/YY
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Security Code Field
            Positioned(
              left: MediaQuery.of(context).size.width - 157,
              top: 615,
              child: GestureDetector(
                onTap: () {
                  FocusScope.of(context).requestFocus(_securityCodeFocus);
                },
                child: Container(
                  width: 133,
                  height: 56,
                  decoration: ShapeDecoration(
                    color: const Color(0xFF2D2F2F),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _securityCodeController,
                      focusNode: _securityCodeFocus,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        border: InputBorder.none,
                        hintText: 'CVV',
                        hintStyle: TextStyle(color: Colors.grey),
                      ),
                      style: const TextStyle(color: Colors.white),
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly, // Only numbers
                        LengthLimitingTextInputFormatter(3), // Limit to 3 digits
                      ],
                    ),
                  ),
                ),
              ),
            ),

            // Labels
            Positioned(
              left: 32,
              top: 390,
              child: Text(
                'Card number',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 490,
              child: Text(
                'Name on card',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: 32,
              top: 590,
              child: Text(
                'Expiry date',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            Positioned(
              left: MediaQuery.of(context).size.width - 155,
              top: 590,
              child: Text(
                'Security code',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Save Changes Button
            Positioned(
              left: 54,
              top: 690,
              child: Container(
                width: MediaQuery.of(context).size.width - 108,
                height: 54,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                    begin: Alignment(1.00, 0.00),
                    end: Alignment(-1, 0),
                    colors: [Color(0xFF3A0964), Color(0xFF940FAB)],
                  ),
                  shape: RoundedRectangleBorder(
                    side: const BorderSide(width: 1),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Center(
                  child: Text(
                    'Save Changes',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),

            // Payment Details Title
            Positioned(
              left: 64,
              top: 50,
              child: Text(
                'Payment Details',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 17,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom formatter for MM/YY expiry date
class CardExpiryInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final newText = newValue.text;
    if (newText.length > 4) {
      return oldValue; // Limit to 4 characters
    }
    if (newText.length == 2 && oldValue.text.length < 2) {
      return TextEditingValue(
        text: '$newText/',
        selection: TextSelection.collapsed(offset: newText.length + 1),
      );
    }
    return newValue;
  }
}