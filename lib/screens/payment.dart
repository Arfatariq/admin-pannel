import 'package:flutter/material.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFF7F0),
      appBar: AppBar(
        title: const Text("Payment"),
        backgroundColor: Colors.deepOrangeAccent,
        foregroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.orange.shade100, blurRadius: 6)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Order Summary",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 12),
                  OrderRow(label: "Item Total", value: "\$45.00"),
                  OrderRow(label: "Tax", value: "\$3.00"),
                  OrderRow(label: "Delivery", value: "\$2.00"),
                  Divider(),
                  OrderRow(label: "Total", value: "\$50.00", isBold: true),
                ],
              ),
            ),
            const SizedBox(height: 30),

            // Payment Method
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(color: Colors.orange.shade100, blurRadius: 6)
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text("Payment Method",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 10),
                  PaymentOption(
                      icon: Icons.credit_card, label: "Credit/Debit Card"),
                  SizedBox(height: 10),
                  PaymentOption(
                      icon: Icons.account_balance_wallet, label: "Wallet"),
                  SizedBox(height: 10),
                  PaymentOption(icon: Icons.paypal, label: "PayPal"),
                ],
              ),
            ),
            const Spacer(),

            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.orange,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child:
                    const Text("Pay \$50.00", style: TextStyle(fontSize: 16)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class OrderRow extends StatelessWidget {
  final String label;
  final String value;
  final bool isBold;

  const OrderRow({
    super.key,
    required this.label,
    required this.value,
    this.isBold = false,
  });

  @override
  Widget build(BuildContext context) {
    final style = TextStyle(
        fontSize: 14, fontWeight: isBold ? FontWeight.bold : FontWeight.normal);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: style),
          Text(value, style: style),
        ],
      ),
    );
  }
}

class PaymentOption extends StatelessWidget {
  final IconData icon;
  final String label;

  const PaymentOption({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: Colors.orange),
        const SizedBox(width: 10),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
}
