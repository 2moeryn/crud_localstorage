import 'dart:io';
import 'package:flutter/material.dart';
import 'firebase_user_service.dart';

class ListPage extends StatelessWidget {
  const ListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("CRUD Via Firebase")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, '/form'),
        child: const Icon(Icons.add),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: FirebaseUserService.getUsers(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final data = snapshot.data!;
          if (data.isEmpty) {
            return const Center(child: Text("Blank Data"));
          }

          return ListView.builder(
            itemCount: data.length,
            itemBuilder: (_, i) {
              final u = data[i];
              final path = u['photoPath'] ?? '';

              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: path.isNotEmpty
                      ? FileImage(File(path))
                      : null,
                  child: path.isEmpty ? const Icon(Icons.person) : null,
                ),
                title: Text("${u['nama_depan']} ${u['nama_belakang']}"),
                subtitle: Text(u['email']),
                onTap: () =>
                    Navigator.pushNamed(context, '/form', arguments: u),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => FirebaseUserService.deleteUser(u['id']),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
