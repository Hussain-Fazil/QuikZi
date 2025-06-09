import 'package:flutter/material.dart';
import 'order_page.dart';

class CartPage extends StatefulWidget {
  final List<Map<String, String>> cartItems;
  final void Function(int) onRemove;

  const CartPage({super.key, required this.cartItems, required this.onRemove});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("My Cart"),
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
      ),
      body: widget.cartItems.isEmpty
          ? Center(
              child: Text(
                "🛒 Your cart is empty!",
                style: TextStyle(fontSize: 20, color: Colors.grey),
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: widget.cartItems.length,
                    itemBuilder: (context, index) {
                      final item = widget.cartItems[index];
                      return Card(
                        elevation: 2,
                        child: ListTile(
                          leading: Image.asset(
                            item['image']!,
                            width: 40,
                            height: 40,
                          ),
                          title: Text(item['title']!),
                          subtitle: Text(item['price']!),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              widget.onRemove(index);
                              setState(() {});
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ),

                // Proceed Button
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => OrderPage(),
                            ),
                          );
                        },
                        icon: const Icon(
                          Icons.receipt_long,
                          color: Colors.white,
                        ),
                        label: const Text(
                          "Proceed to Order",
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: theme.primaryColor,
                          padding: const EdgeInsets.symmetric(vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
