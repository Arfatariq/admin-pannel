import 'package:admin_pannel/components/colors.dart';
import 'package:admin_pannel/models/UserModel.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AllUsersScreen extends StatefulWidget {
  const AllUsersScreen({super.key});

  @override
  State<AllUsersScreen> createState() => _AllUsersScreenState();
}

class _AllUsersScreenState extends State<AllUsersScreen> {
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    final snapshot = await FirebaseFirestore.instance.collection('users').get();
    return snapshot.docs.map((doc) => doc.data()).toList();
  }

  // ignore: non_constant_identifier_names
  UserModel? SelectedUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('All Users'),
        backgroundColor: Colors.orange.shade700,
        foregroundColor: Colors.white,
        elevation: 6,
      ),
      body: FutureBuilder(
        future: fetchUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found.'));
          }

          final users = snapshot.data as List<Map<String, dynamic>>;

          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Left: User List
              Expanded(
                flex: 3,
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    Text(
                      'Total Users: ${users.length}',
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: users.length,
                        itemBuilder: (context, index) {
                          final user = users[index];
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                              elevation: 4,
                              child: ListTile(
                                leading: const Icon(Icons.person,
                                    color: Colors.orange),
                                title: Text(
                                  user['name'] ?? 'No Name',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                subtitle: Text(user['email'] ?? 'No Email'),
                                trailing: const Icon(Icons.arrow_forward_ios,
                                    size: 16),
                                onTap: () {
                                  setState(() {
                                    SelectedUser = UserModel(
                                      id: user['id'] ?? '',
                                      name: user['name'] ?? '',
                                      email: user['email'] ?? '',
                                      number: user['number'] ?? '',
                                    );
                                  });
                                },
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),

              // Right: User Details Panel
              Container(
                width: 300,
                padding: const EdgeInsets.all(16),
                color: const Color.fromARGB(255, 253, 206, 182),
                child: SelectedUser == null
                    ? const Center(child: Text("Select a user for details"))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                              backgroundColor: MyAppColors.iconColor,
                              radius: 30,
                              child: Icon(Icons.person, size: 30)),
                          const SizedBox(height: 16),
                          Text("Name: ${SelectedUser!.name}",
                              style: const TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w600)),
                          Text("Email: ${SelectedUser!.email}",
                              style: const TextStyle(fontSize: 16)),
                          Text("Phone: ${SelectedUser!.number}",
                              style: const TextStyle(fontSize: 16)),
                          Text("ID: ${SelectedUser!.id}",
                              style: const TextStyle(fontSize: 16)),
                          const Spacer(),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("Edit clicked")));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: MyAppColors.iconColor),
                                child: const Text("Edit"),
                              ),
                              const SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () async {
                                  final confirm = await showDialog<bool>(
                                    context: context,
                                    builder: (_) => AlertDialog(
                                      title: const Text('Delete User?'),
                                      content: const Text("Are you sure?"),
                                      actions: [
                                        TextButton(
                                          onPressed: () =>
                                              Navigator.pop(context, false),
                                          child: const Text("Cancel"),
                                        ),
                                        ElevatedButton(
                                          onPressed: () =>
                                              Navigator.pop(context, true),
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor:
                                                  MyAppColors.iconColor),
                                          child: const Text("Delete"),
                                        ),
                                      ],
                                    ),
                                  );
                                  if (confirm == true) {
                                    await FirebaseFirestore.instance
                                        .collection('users')
                                        .doc(SelectedUser!.id)
                                        .delete();
                                    setState(() {
                                      SelectedUser = null;
                                    });
                                    // ignore: use_build_context_synchronously
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                          content: Text("User deleted")),
                                    );
                                  }
                                },
                                child: const Text("Delete"),
                              ),
                            ],
                          )
                        ],
                      ),
              )
            ],
          );
        },
      ),
    );
  }
}
