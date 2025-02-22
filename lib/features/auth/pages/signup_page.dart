import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    nameController.dispose();

    super.dispose();
  }

  void signUpUser() {
    if (formKey.currentState!.validate()) {}
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Form(
          key: formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Sign Up.",
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: "Name",
                ),
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return "Name field cannot be empty";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  hintText: "Email",
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      !value.contains("@")) {
                    return "Email field is invalid";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                controller: passwordController,
                decoration: const InputDecoration(
                  hintText: "Password",
                ),
                validator: (value) {
                  if (value == null ||
                      value.trim().isEmpty ||
                      value.length <= 6) {
                    return "Password field is invalid";
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              ElevatedButton(
                onPressed: signUpUser,
                child: const Text(
                  'SIGN UP',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              RichText(
                text: TextSpan(
                  text: 'Already have an account?',
                  style: Theme.of(context).textTheme.titleMedium,
                  children: const [
                    TextSpan(
                      text: "Sign in",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
    );
  }
}
