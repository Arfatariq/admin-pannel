import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Orderhistorypage extends StatefulWidget {
  const Orderhistorypage({super.key});

  @override
  State<Orderhistorypage> createState() => _OrderhistorypageState();
}

class _OrderhistorypageState extends State<Orderhistorypage> {
  Future<List<Map<String, dynamic>>> fetchAllOrdersForAdmin() async {
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    List<Map<String, dynamic>> allUserOrders = [];

    try {
      final usersSnapshot = await firestore.collection('users').get();

      for (var userDoc in usersSnapshot.docs) {
        final userId = userDoc.id;

        final cartSnapshot = await firestore
            .collection('users')
            .doc(userId)
            .collection('Cart')
            .get();

        for (var cartDoc in cartSnapshot.docs) {
          final data = cartDoc.data();
          data['userId'] = userId;
          allUserOrders.add(data);
        }
      }
      // ignore: empty_catches
    } catch (e) {}

    return allUserOrders;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Orders'),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: fetchAllOrdersForAdmin(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("No orders found."));
          }

          final orders = snapshot.data!;

          return ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: orders.length,
            itemBuilder: (context, index) {
              final order = orders[index];
              final productName = order['productName'] ?? 'N/A';
              final productPrice = order['productPrice'] ?? 'N/A';
              final quantity = order['quantity'] ?? 1;
              final imageUrl = order['imageUrl'] ?? '';
              final userId = order['userId'];

              return Card(
                elevation: 3,
                margin: const EdgeInsets.symmetric(vertical: 8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(16),
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: imageUrl.isNotEmpty
                        ? Image.network(
                            imageUrl,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          )
                        : const Icon(Icons.image_not_supported, size: 40),
                  ),
                  title: Text(
                    productName,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 4),
                      Text("Quantity: $quantity"),
                      Text("Price: $productPrice"),
                      const SizedBox(height: 6),
                      Text(
                        "User ID: $userId",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
