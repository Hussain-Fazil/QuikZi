import 'package:flutter/material.dart';
import 'package:badges/badges.dart' as badges;
import 'cart_page.dart';
import 'home_screen.dart';
import 'order_page.dart';
import 'about_page.dart';

class Homepage extends StatefulWidget {
  final VoidCallback toggleTheme;
  final bool isDark;

  const Homepage({super.key, required this.toggleTheme, required this.isDark});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int currentIndex = 0;
  List<Map<String, String>> cartItems = [];

  void addToCart(String title, String image, String price) {
    setState(() {
      cartItems.add({"title": title, "image": image, "price": price});
    });
  }

  void removeFromCart(int index) {
    setState(() {
      cartItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final darkModeEnabled = widget.isDark;

    final pages = [
      HomeScreen(addToCart: addToCart),
      CartPage(cartItems: cartItems, onRemove: removeFromCart),
      const OrderPage(),
      const AboutPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("QuikZi", style: TextStyle(color: theme.primaryColor)),
        backgroundColor:
            theme.appBarTheme.backgroundColor ?? theme.scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          badges.Badge(
            badgeContent: Text(
              '${cartItems.length}',
              style: const TextStyle(color: Colors.white),
            ),
            badgeStyle: const badges.BadgeStyle(badgeColor: Colors.red),
            child: IconButton(
              icon: Icon(
                Icons.shopping_bag_outlined,
                color: theme.primaryColor,
              ),
              onPressed: () {
                setState(() {
                  currentIndex = 1;
                });
              },
            ),
          ),
          IconButton(
            onPressed: () {
              widget.toggleTheme();
              setState(() {});
            },
            icon: Icon(
              darkModeEnabled ? Icons.dark_mode : Icons.light_mode,
              color: theme.primaryColor,
            ),
          ),
        ],
      ),
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        selectedItemColor: theme.primaryColor,
        unselectedItemColor: theme.hintColor,
        backgroundColor: theme.scaffoldBackgroundColor,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.receipt_long),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
        ],
      ),
    );
  }
}
