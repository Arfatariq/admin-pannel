import 'package:admin_pannel/components/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../models/menuitem.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  MenuItemModel? selectedItem;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Menu"),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      //using stream builder as it updates automatically when data changes in Firestore
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('Menu').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          final docs = snapshot.data!.docs;

          // Add Firestore ID to each model
          final menuItems = docs.map((doc) {
            final data = doc.data() as Map<String, dynamic>;
            data['id'] = doc.id;
            return MenuItemModel.fromMap(data);
          }).toList();

          return Row(
            children: [
              // Left side: List
              Expanded(
                flex: 1,
                child: ListView.builder(
                  itemCount: menuItems.length,
                  itemBuilder: (context, index) {
                    final item = menuItems[index];
                    print("index $index = ${item.image}");
                    return Card(
                      child: ListTile(
                        leading: Image.network(
                          item.image,
                          width: 50,
                          height: 50,
                          fit: BoxFit.cover,
                        ),
                        title: Text(item.name),
                        onTap: () {
                          setState(() {
                            selectedItem = item;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),

              // Right side pannel with details of each product
              Container(
                width: 350,
                padding: const EdgeInsets.all(16),
                color: const Color.fromARGB(255, 253, 206, 182),
                child: selectedItem == null
                    ? const Center(
                        child: Text("Select a product to see details"))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            selectedItem!.name,
                            style: const TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            // child: Image.network(
                            //   selectedItem!.imageUrl,
                            //   width: double.infinity,
                            //   height: 180,
                            //   fit: BoxFit.cover,
                            //   // If the image fails to load, this widget will be shown:
                            //   errorBuilder: (context, error, stackTrace) {
                            //     return Container(
                            //       width: double.infinity,
                            //       height: 180,
                            //       color: Colors.grey[300],
                            //       child: const Icon(
                            //         Icons.broken_image,
                            //         size: 40,
                            //         color: Colors.grey,
                            //       ),
                            //     );
                            //   },
                            // ),
                          ),
                          const SizedBox(height: 10),
                          Text(
                            selectedItem!.discription,
                            style: const TextStyle(fontSize: 14),
                          ),
                          Text(
                            "Price: ${selectedItem!.price}",
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const Spacer(),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Edit clicked")),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: MyAppColors.iconColor),
                                child: const Text("Edit"),
                              ),
                              ElevatedButton(
                                onPressed: () async {
                                  final confirm = await showDialog<bool>(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text("Delete Confirmation"),
                                      content: const Text(
                                          "Are you sure you want to delete this item?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text("Cancel"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          child: const Text("Delete"),
                                        ),
                                      ],
                                    ),
                                  );

                                  if (confirm == true) {
                                    await FirebaseFirestore.instance
                                        .collection('Menu')
                                        .doc(selectedItem!.id)
                                        .delete();

                                    setState(() {
                                      selectedItem = null;
                                    });

                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text(
                                              "Item deleted successfully")),
                                    );
                                  }
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: MyAppColors.iconColor),
                                child: const Text("Delete"),
                              ),
                            ],
                          )
                        ],
                      ),
              ),
            ],
          );
        },
      ),
    );
  }
}
