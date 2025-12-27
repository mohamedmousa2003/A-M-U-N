import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ForgetPassword extends StatefulWidget {
  static const String routeName = 'forget_password';
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Forget Password")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Enter your email to reset your password",
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
                validator: (text) {
                  if (text == null || text.isEmpty) {
                    return "Email is required";
                  }
                  if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$')
                      .hasMatch(text)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: isLoading ? null : _sendResetEmail,
                child: isLoading
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Send Reset Email"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _sendResetEmail() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              "Password reset email sent! Check your email to change your password."),
          backgroundColor: Colors.green,
        ),
      );

      await Future.delayed(Duration(seconds: 2));
      Navigator.of(context).pop();

    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(e.message ?? "Error sending reset email"),
          backgroundColor: Colors.red,
        ),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }
}
