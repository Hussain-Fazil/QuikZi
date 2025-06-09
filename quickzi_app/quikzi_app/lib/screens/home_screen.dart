import 'package:flutter/material.dart';
import 'product_detail_page.dart';

class HomeScreen extends StatelessWidget {
  final Function(String, String, String) addToCart;

  const HomeScreen({super.key, required this.addToCart});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        Text(
          "Categories",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 15),
        SizedBox(
          height: 80,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              categoryTile("Laptop", "lib/assets/laptop.png", context),
              categoryTile("Keyboard", "lib/assets/keyboard.png", context),
              categoryTile("Headset", "lib/assets/headset.png", context),
              categoryTile("Controller", "lib/assets/controller.png", context),
              categoryTile("Mouse", "lib/assets/mouse.png", context),
            ],
          ),
        ),
        const SizedBox(height: 30),
        Text(
          "Best Selling",
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: theme.primaryColor,
          ),
        ),
        const SizedBox(height: 15),
        GridView.count(
          crossAxisCount: 2,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          mainAxisSpacing: 15,
          crossAxisSpacing: 15,
          childAspectRatio: isPortrait ? 0.7 : 1.35, // 👈 Landscape adjusted!
          children: [
            productCard(
              context,
              "TUF Gaming Laptop",
              "lib/assets/laptop.png",
              "Rs.289,000",
            ),
            productCard(
              context,
              "RGB Keyboard",
              "lib/assets/keyboard.png",
              "Rs.9,500",
            ),
            productCard(
              context,
              "Gaming Headset",
              "lib/assets/headset.png",
              "Rs.14,500",
            ),
            productCard(
              context,
              "PS4 Controller",
              "lib/assets/controller.png",
              "Rs.11,990",
            ),
            productCard(
              context,
              "ROG Mouse",
              "lib/assets/mouse.png",
              "Rs.5,500",
            ),
          ],
        ),
      ],
    );
  }

  Widget categoryTile(String name, String imgPath, BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(right: 12),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: theme.cardColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
      ),
      child: Row(
        children: [
          Image.asset(imgPath, height: 40),
          const SizedBox(width: 10),
          Text(name, style: TextStyle(fontSize: 16, color: theme.primaryColor)),
        ],
      ),
    );
  }

  Widget productCard(
    BuildContext context,
    String title,
    String imgPath,
    String price,
  ) {
    final theme = Theme.of(context);
    final isPortrait =
        MediaQuery.of(context).orientation == Orientation.portrait;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailPage(
              title: title,
              image: imgPath,
              price: price,
              onAddToCart: addToCart,
            ),
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: theme.cardColor,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 5)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: Icon(Icons.favorite_border, color: theme.iconTheme.color),
            ),
            Expanded(
              child: Center(
                child: Image.asset(
                  imgPath,
                  height: isPortrait
                      ? MediaQuery.of(context).size.width * 0.25
                      : MediaQuery.of(context).size.height * 0.35,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 4),
            Text(price, style: TextStyle(fontSize: 14, color: theme.hintColor)),
            Align(
              alignment: Alignment.bottomRight,
              child: Icon(Icons.touch_app, color: theme.primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
