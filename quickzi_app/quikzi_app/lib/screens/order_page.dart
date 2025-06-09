import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  String? _selectedPayment;
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Checkout",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: theme.primaryColor,
              ),
            ),
            const SizedBox(height: 20),

            // Name
            TextFormField(
              decoration: const InputDecoration(labelText: "Full Name"),
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter your name';
                return null;
              },
            ),
            const SizedBox(height: 15),

            // Contact
            TextFormField(
              decoration: const InputDecoration(labelText: "Contact Number"),
              keyboardType: TextInputType.phone,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter contact number';
                if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
                  return 'Enter a valid 10-digit number';
                }
                return null;
              },
            ),
            const SizedBox(height: 15),

            // Address
            TextFormField(
              decoration: const InputDecoration(labelText: "Delivery Address"),
              maxLines: 2,
              validator: (value) {
                if (value == null || value.isEmpty)
                  return 'Please enter address';
                return null;
              },
            ),
            const SizedBox(height: 15),

            // Dropdown for Payment
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(labelText: "Payment Method"),
              value: _selectedPayment,
              items: ['Cash on Delivery', 'Credit Card', 'Mobile Payment']
                  .map(
                    (method) =>
                        DropdownMenuItem(value: method, child: Text(method)),
                  )
                  .toList(),
              onChanged: (value) => setState(() => _selectedPayment = value),
              validator: (value) =>
                  value == null ? 'Select payment method' : null,
            ),
            const SizedBox(height: 15),

            // Checkbox
            CheckboxListTile(
              title: const Text("I agree to the Terms & Conditions"),
              value: _agree,
              onChanged: (value) => setState(() => _agree = value!),
              controlAffinity: ListTileControlAffinity.leading,
            ),

            const SizedBox(height: 25),

            // Submit Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate() && _agree) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Order submitted!")),
                    );
                  }
                },
                child: const Text("Place Order"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
