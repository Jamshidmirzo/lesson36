import 'package:flutter/material.dart';
import 'package:lesson36/homepage.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  final nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orange.shade200,
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.orange.shade200,
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Input your name ',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: nameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20)),
                  prefixIcon: Icon(Icons.abc_outlined),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) {
                          return Homepage(nameController.text);
                        },
                      ),
                    );
                  },
                  child: Text(
                    'Start game',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
