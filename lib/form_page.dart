import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'firebase_user_service.dart';

class FormPage extends StatefulWidget {
  final Map<String, dynamic>? user;
  const FormPage({super.key, this.user});

  @override
  State<FormPage> createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final keyForm = GlobalKey<FormState>();

  late TextEditingController ndepan, nbelakang, email, username;
  File? photo;
  bool loading = false;

  bool get isEdit => widget.user != null;

  @override
  void initState() {
    super.initState();
    ndepan = TextEditingController(text: widget.user?['nama_depan'] ?? '');
    nbelakang = TextEditingController(
      text: widget.user?['nama_belakang'] ?? '',
    );
    email = TextEditingController(text: widget.user?['email'] ?? '');
    username = TextEditingController(text: widget.user?['username'] ?? '');

    final path = widget.user?['photoPath'];
    if (path != null && path.toString().isNotEmpty) {
      photo = File(path);
    }
  }

  Future<void> pickPhoto() async {
    final x = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (x != null) setState(() => photo = File(x.path));
  }

  Future<void> submit() async {
    if (!keyForm.currentState!.validate()) return;

    setState(() => loading = true);

    await FirebaseUserService.saveUser(
      id: widget.user?['id'],
      ndepan: ndepan.text.trim(),
      nbelakang: nbelakang.text.trim(),
      email: email.text.trim(),
      username: username.text.trim(),
      photoPath: photo?.path,
    );

    if (!mounted) return;
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isEdit ? "Update User" : "Tambah User")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: keyForm,
          child: ListView(
            children: [
              TextButton.icon(
                onPressed: pickPhoto,
                icon: const Icon(Icons.image),
                label: const Text("Pilih Foto"),
              ),

              if (photo != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Image.file(photo!, height: 120),
                ),

              TextFormField(
                controller: ndepan,
                decoration: const InputDecoration(labelText: "Nama Depan"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: nbelakang,
                decoration: const InputDecoration(labelText: "Nama Belakang"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: email,
                decoration: const InputDecoration(labelText: "Email"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),
              TextFormField(
                controller: username,
                decoration: const InputDecoration(labelText: "Username"),
                validator: (v) => v!.isEmpty ? "Wajib diisi" : null,
              ),

              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: loading ? null : submit,
                child: loading
                    ? const CircularProgressIndicator()
                    : const Text("SIMPAN"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
