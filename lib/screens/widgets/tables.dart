import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Tables extends StatefulWidget {
  const Tables({super.key});

  @override
  State<Tables> createState() => _TablesState();
}

class _TablesState extends State<Tables> {
  Future<List<Map<String, dynamic>>> fetchTables() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('Tables').get();

    return snapshot.docs.map((doc) {
      final data = doc.data();
      data['id'] = doc.id; // ✅ Add document ID manually
      return data;
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Tables'),
        toolbarHeight: 60,
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
        elevation: 6,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: FutureBuilder(
        future: fetchTables(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No tables found.'));
          }

          final tablesList = snapshot.data as List<Map<String, dynamic>>;

          return Column(
            children: [
              const SizedBox(height: 10),
              Text("Total Tables: ${tablesList.length}"),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: tablesList.length,
                  itemBuilder: (context, index) {
                    final tableData = tablesList[index];

                    final isReserved = tableData['isReserved'] == false;

                    return Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 4,
                        child: ListTile(
                          leading:
                              const Icon(Icons.table_bar, color: Colors.orange),

                          // ✅ Show document ID instead of "No Number"
                          title: Text(
                            tableData['id'] ?? 'No ID',
                            style: const TextStyle(fontWeight: FontWeight.w600),
                          ),

                          subtitle: Row(
                            children: [
                              Icon(
                                Icons.circle,
                                size: 10,
                                color: isReserved ? Colors.red : Colors.green,
                              ),
                              const SizedBox(width: 5),
                              Text(
                                isReserved ? "Reserved" : "Not Reserved",
                                style: TextStyle(
                                  color: isReserved ? Colors.green : Colors.red,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),

                          trailing:
                              const Icon(Icons.arrow_forward_ios, size: 16),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
