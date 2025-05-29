import 'package:flutter/material.dart';
import 'package:provider/provider.dart'; // Import Provider
import 'food_item.dart';
import 'cart_provider.dart'; // Import the new CartProvider

class FoodDetailPage extends StatelessWidget {
  final FoodItem foodItem;

  FoodDetailPage({required this.foodItem});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(foodItem.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(foodItem.imageUrl, height: 200, width: 400, fit: BoxFit.cover),
              const SizedBox(height: 16),
              Text(
                foodItem.description,
                style: const TextStyle(fontSize: 18),
              ),
              const SizedBox(height: 16),
              const Text(
                'Available Variants:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Use a Consumer to rebuild only the variant list when cart changes
              Consumer<CartProvider>(
                builder: (context, cartProvider, child) {
                  return Column(
                    children: _getVariants(foodItem, cartProvider),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _getVariants(FoodItem foodItem, CartProvider cartProvider) {
    switch (foodItem.name) {
      case 'Appetizers':
        return [
          _foodVariantCard('Chicken Wings', 'Crispy chicken wings tossed in sauce', 9.99, 'assets/chicken wings.png', cartProvider),
          _foodVariantCard('Onion Rings', 'Golden-fried onion rings', 10.99, 'assets/onion rings.png', cartProvider),
          _foodVariantCard('Tacos', 'Soft shell tacos filled with meat and toppings', 6.99, 'assets/tacos.png', cartProvider),
          _foodVariantCard('Spring Rolls', 'Crispy spring rolls with dipping sauce', 5.49, 'assets/spring rolls.png', cartProvider),
          _foodVariantCard('Salad', 'Fresh garden salad with dressing', 4.99, 'assets/salad.png', cartProvider),
          _foodVariantCard('Fries', 'Crispy french fries', 3.99, 'assets/fries.png', cartProvider),
        ];
      case 'Pizza':
        return [
          _foodVariantCard('Margherita Pizza', 'Classic Margherita with fresh mozzarella and basil', 9.99, 'assets/margherita pizza.png', cartProvider),
          _foodVariantCard('Pepperoni Pizza', 'Loaded with spicy pepperoni and mozzarella cheese', 10.99, 'assets/pepperoni pizza.png', cartProvider),
          _foodVariantCard('Vegetarian Pizza', 'Topped with seasonal vegetables and olives', 9.49, 'assets/vegetarian pizza.png', cartProvider),
          _foodVariantCard('Chicken Ranch Pizza', 'Topped with delicious flavors of barbecue, chicken and Ranch dressing', 13.2, 'assets/chicken ranch pizza.png', cartProvider),
          _foodVariantCard('Super Beef Pizza', 'Loaded with meatballs, salami, beef, onion and mozzarella cheese', 14.1, 'assets/super beef pizza.png', cartProvider),
          _foodVariantCard('Frutti Di Mare Pizza', 'Loaded with shrimps, crabs and vegetables', 15.4, 'assets/frutti di mare pizza.png', cartProvider),
        ];
      case 'Burger':
        return [
          _foodVariantCard('Cheeseburger', 'Juicy beef patty with cheese', 8.99, 'assets/cheeseburger.png', cartProvider),
          _foodVariantCard('Veggie Burger', 'Healthy veggie patty with fresh toppings', 7.99, 'assets/veggie burger.png', cartProvider),
          _foodVariantCard('BBQ Burger', 'BBQ sauce with crispy onion rings', 9.49, 'assets/bbq burger.png', cartProvider),
        ];
      case 'Chicken':
        return [
          _foodVariantCard('Grilled Chicken', 'Seasoned grilled chicken breast', 10.99, 'assets/grilled chicken.png', cartProvider),
          _foodVariantCard('Fried Chicken', 'Crispy fried chicken pieces', 9.99, 'assets/fried chicken.png', cartProvider),
          _foodVariantCard('Spicy Chicken', 'Spicy marinated chicken wings', 11.49, 'assets/spicy chicken.png', cartProvider),
        ];
      case 'Steak':
        return [
          _foodVariantCard('Ribeye Steak', 'Tender ribeye steak grilled to perfection', 15.99, 'assets/ribeye steak.png', cartProvider),
          _foodVariantCard('Filet Mignon', 'Luxury filet mignon with garlic butter', 19.99, 'assets/filet mignon.png', cartProvider),
          _foodVariantCard('Sirloin Steak', 'Savory sirloin steak served with sauce', 14.99, 'assets/sirloin steak.png', cartProvider),
        ];
      case 'Ham':
        return [
          _foodVariantCard('Smoked Ham', 'Deliciously smoked ham with a savory flavor', 12.99, 'assets/smoked ham.png', cartProvider),
          _foodVariantCard('Honey Glazed Ham', 'Sweet honey glazed ham', 13.99, 'assets/honey glazed ham.png', cartProvider),
          _foodVariantCard('Spicy Ham', 'Spicy variant of smoked ham', 13.49, 'assets/spicy ham.png', cartProvider),
        ];
      case 'Sushi':
        return [
          _foodVariantCard('California Roll', 'Crab, avocado, and cucumber roll', 14.99, 'assets/california roll.png', cartProvider),
          _foodVariantCard('Spicy Tuna Roll', 'Tuna with spicy mayo and cucumber', 15.49, 'assets/spicy tuna roll.png', cartProvider),
          _foodVariantCard('Salmon Roll', 'Salmon wrapped in rice', 13.99, 'assets/salmon roll.png', cartProvider),
        ];
      case 'Seafood':
        return [
          _foodVariantCard('Grilled Salmon', 'Salmon fillet grilled to perfection', 18.99, 'assets/Grilled Salmon.png', cartProvider),
          _foodVariantCard('Shrimp Cocktail', 'Succulent shrimp served with cocktail sauce', 16.99, 'assets/Shrimp Cocktail.png', cartProvider),
          _foodVariantCard('Mixed Seafood Platter', 'A variety of fresh seafood', 20.99, 'assets/Mixed Seafood Platter.png', cartProvider),
        ];
      case 'Pasta':
        return [
          _foodVariantCard('Alfredo Pasta', 'Creamy fettuccine alfredo', 11.99, 'assets/alfredo pasta.png', cartProvider),
          _foodVariantCard('Pesto Pasta', 'Pasta with fresh basil pesto', 12.49, 'assets/pesto pasta.png', cartProvider),
          _foodVariantCard('Spaghetti Bolognese', 'Spaghetti with hearty meat sauce', 12.99, 'assets/spaghetti bolognese.png', cartProvider),
        ];
      case 'Ice Cream':
        return [
          _foodVariantCard('Vanilla Ice Cream', 'Classic vanilla flavor', 3.50, 'assets/vanilla ice cream.png', cartProvider),
          _foodVariantCard('Chocolate Ice Cream', 'Rich chocolate flavor', 3.50, 'assets/chocolate ice cream.png', cartProvider),
          _foodVariantCard('Strawberry Ice Cream', 'Fresh strawberry flavor', 3.50, 'assets/strawberry ice cream.png', cartProvider),
        ];
      case 'Cake':
        return [
          _foodVariantCard('Chocolate Cake', 'Rich and delicious chocolate cake', 5.50, 'assets/chocolate cake.png', cartProvider),
          _foodVariantCard('Vanilla Cake', 'Light vanilla cake with frosting', 5.50, 'assets/vanilla cake.png', cartProvider),
          _foodVariantCard('Carrot Cake', 'Moist carrot cake with cream cheese icing', 6.00, 'assets/carrot cake.png', cartProvider),
        ];
      case 'Pudding':
        return [
          _foodVariantCard('Chocolate Pudding', 'Smooth chocolate pudding', 3.50, 'assets/chocolate pudding.png', cartProvider),
          _foodVariantCard('Vanilla Pudding', 'Creamy vanilla pudding', 3.50, 'assets/vanilla pudding.png', cartProvider),
          _foodVariantCard('Rice Pudding', 'Traditional rice pudding with cinnamon', 3.50, 'assets/rice pudding.png', cartProvider),
        ];
      case 'Cupcake':
        return [
          _foodVariantCard('Chocolate Cupcake', 'Rich chocolate cupcake', 2.50, 'assets/chocolate cupcake.png', cartProvider),
          _foodVariantCard('Vanilla Cupcake', 'Classic vanilla cupcake', 2.50, 'assets/vanilla cupcake.png', cartProvider),
          _foodVariantCard('Red Velvet Cupcake', 'Moist red velvet cupcake', 3.00, 'assets/red velvet cupcake.png', cartProvider),
        ];
      case 'Cheesecake':
        return [
          _foodVariantCard('New York Cheesecake', 'Classic New York-style cheesecake', 5.99, 'assets/new york cheesecake.png', cartProvider),
          _foodVariantCard('Berry Cheesecake', 'Cheesecake topped with fresh berries', 6.50, 'assets/berry cheesecake.png', cartProvider),
          _foodVariantCard('Chocolate Cheesecake', 'Rich chocolate cheesecake', 6.00, 'assets/chocolate cheesecake.png', cartProvider),
        ];
      case 'Brownie':
        return [
          _foodVariantCard('Classic Brownie', 'Fudgy brownie topped with chocolate', 3.99, 'assets/classic brownie.png', cartProvider),
          _foodVariantCard('Walnut Brownie', 'Brownie with walnuts', 4.00, 'assets/walnut brownie.png', cartProvider),
          _foodVariantCard('Peanut Butter Brownie', 'Brownie with peanut butter swirl', 4.50, 'assets/peanut butter brownie.png', cartProvider),
        ];
      case 'Cookies':
        return [
          _foodVariantCard('Chocolate Chip Cookies', 'Freshly baked chocolate chip cookies', 1.99, 'assets/chocolate chip cookies.png', cartProvider),
          _foodVariantCard('Oatmeal Raisin Cookies', 'Delicious oatmeal raisin cookies', 2.00, 'assets/oatmeal raisin cookies.png', cartProvider),
          _foodVariantCard('Peanut Butter Cookies', 'Rich peanut butter cookies', 2.50, 'assets/peanut butter cookies.png', cartProvider),
        ];
      case 'Doughnut':
        return [
          _foodVariantCard('Glazed Doughnut', 'Classic glazed doughnut', 2.50, 'assets/glazed doughnut.png', cartProvider),
          _foodVariantCard('Chocolate Doughnut', 'Chocolate-covered doughnut', 2.50, 'assets/chocolate doughnut.png', cartProvider),
          _foodVariantCard('Sprinkled Doughnut', 'Doughnut with colorful sprinkles', 2.50, 'assets/sprinkled doughnut.png', cartProvider),
        ];
      case 'Hot Drinks':
        return [
          _foodVariantCard('Hot Chocolate', 'Rich hot chocolate', 3.00, 'assets/hot chocolate.png', cartProvider),
          _foodVariantCard('Chai Latte', 'Spiced chai latte', 3.50, 'assets/chai latte.png', cartProvider),
          _foodVariantCard('Cappuccino', 'Classic cappuccino', 3.50, 'assets/cappuccino.png', cartProvider),
          _foodVariantCard('Green Tea', 'Refreshing green tea', 2.50, 'assets/green tea.png', cartProvider),
          _foodVariantCard('Black Tea', 'Classic black tea', 2.50, 'assets/black tea.png', cartProvider),
          _foodVariantCard('Herbal Tea', 'Soothing herbal tea', 2.50, 'assets/herbal tea.png', cartProvider),
          _foodVariantCard('Espresso', 'Strong espresso coffee', 2.50, 'assets/espresso.png', cartProvider),
          _foodVariantCard('Americano', 'Classic americano', 2.50, 'assets/americano.png', cartProvider),
          _foodVariantCard('Latte', 'Smooth latte coffee', 3.00, 'assets/latte.png', cartProvider),
        ];
      case 'Cocktails':
        return [
          _foodVariantCard('Mojito', 'Refreshing mint mojito', 7.99, 'assets/mojito.png', cartProvider),
          _foodVariantCard('Pina Colada', 'Tropical pina colada', 8.50, 'assets/pina colada.png', cartProvider),
          _foodVariantCard('Margarita', 'Classic margarita cocktail', 8.99, 'assets/margarita.png', cartProvider),
        ];
      case 'Soft Drinks':
        return [
          _foodVariantCard('Cola', 'Classic cola drink', 2.50, 'assets/cola.png', cartProvider),
          _foodVariantCard('Lemonade', 'Freshly squeezed lemonade', 2.50, 'assets/lemonade.png', cartProvider),
          _foodVariantCard('Sprite', 'Refreshing lemon-lime soda', 2.50, 'assets/sprite.png', cartProvider),
        ];
      case 'Iced Tea':
        return [
          _foodVariantCard('Peach Iced Tea', 'Sweet peach iced tea', 2.50, 'assets/peach iced tea.png', cartProvider),
          _foodVariantCard('Lemon Iced Tea', 'Zesty lemon iced tea', 2.50, 'assets/lemon iced tea.png', cartProvider),
          _foodVariantCard('Mint Iced Tea', 'Refreshing mint iced tea', 2.50, 'assets/mint iced tea.png', cartProvider),
        ];
      case 'Juices':
        return [
          _foodVariantCard('Orange Juice', 'Freshly squeezed orange juice', 2.50, 'assets/orange juice.png', cartProvider),
          _foodVariantCard('Apple Juice', 'Crisp apple juice', 2.50, 'assets/apple juice.png', cartProvider),
          _foodVariantCard('Carrot Juice', 'Healthy carrot juice', 2.50, 'assets/carrot juice.png', cartProvider),
        ];
      case 'Smoothies':
        return [
          _foodVariantCard('Berry Smoothie', 'Mixed berry smoothie', 3.50, 'assets/berry smoothie.png', cartProvider),
          _foodVariantCard('Mango Smoothie', 'Tropical mango smoothie', 3.50, 'assets/mango smoothie.png', cartProvider),
          _foodVariantCard('Green Smoothie', 'Healthy green smoothie', 3.50, 'assets/green smoothie.png', cartProvider),
        ];
      case 'Iced Coffee':
        return [
          _foodVariantCard('Iced Latte', 'Smooth iced latte', 3.50, 'assets/iced latte.png', cartProvider),
          _foodVariantCard('Iced Mocha', 'Rich iced mocha', 3.50, 'assets/iced mocha.png', cartProvider),
          _foodVariantCard('Iced Americano', 'Bold iced americano', 3.50, 'assets/iced americano.png', cartProvider),
        ];
      case 'Honey Mustard Chicken':
        return [
          _foodVariantCard('Honey Mustard Chicken', 'chicken breast or chicken thigh simmered in a luscious honey mustard sauce', 12.99, 'assets/honey mustard chicken.png', cartProvider),
        ];
      case 'Piccata Mushroom Steak':
        return [
          _foodVariantCard('Piccata Mushroom Steak', 'chicken cooked with white wine, lemon juice, and butter', 14.99, 'assets/piccata mushroom steak.png', cartProvider),
        ];
      default:
        return [const Text('No variants available.')];
    }
  }

  Widget _foodVariantCard(String name, String description, double price, String imageUrl, CartProvider cartProvider) {
    int currentCount = cartProvider.getItemCount(name);

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      elevation: 3, // Add a subtle shadow
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)), // Rounded corners
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(imageUrl, height: 80, width: 80, fit: BoxFit.cover),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors.deepPurple, // A nice accent color
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '\$${price.toStringAsFixed(2)}',
                    style: const TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade50, // Light background for controls
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.remove_circle, color: Colors.deepPurple),
                    onPressed: () {
                      cartProvider.removeItem(name);
                    },
                    visualDensity: VisualDensity.compact, // Make buttons smaller
                  ),
                  Text(
                    '$currentCount',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.add_circle, color: Colors.deepPurple),
                    onPressed: () {
                      cartProvider.addItem(name, price, imageUrl);
                    },
                    visualDensity: VisualDensity.compact,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
