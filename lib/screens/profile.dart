import 'package:flutter/material.dart';
import '../widgets/auth/bouttom_auth.dart';
import '../widgets/auth/custom_input_field.dart';

class Profile extends StatelessWidget {

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController locationController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline),
            label: '',
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              const SizedBox(height: 20),

              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: CircleAvatar(
                      backgroundColor: Colors.grey[200],
                      child: Icon(Icons.arrow_back_ios_new,
                          size: 16, color: Colors.grey),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "الملف الشخصي",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              const Icon(Icons.account_circle,
                  size: 100, color: Colors.black87),

              const SizedBox(height: 30),

              CustomInputField(
                label: "اسم المستخدم",
                hintText: "اسم المستخدم",
                icon: Icons.person,
                controller: emailController,
              ),
              //const SizedBox(height: 5),
              CustomInputField(
                label: "البريد الالكتروني",
                hintText: "البريد الالكتروني",
                icon: Icons.email,
                controller: emailController,
              ),
              //const SizedBox(height: 16),
              CustomInputField(
                label: "رقم الهاتف",
                hintText: "رقم الهاتف",
                icon: Icons.phone,
                controller: phoneController,
              ),
              //const SizedBox(height: 16),
              CustomInputField(
                label: "كلمة المرور",
                hintText: "كلمة المرور",
                icon: Icons.lock,
                controller: passwordController,
                isPassword: true,
              ),
              //const SizedBox(height: 16),
              CustomInputField(
                label: "تفاصيل الموقع",
                hintText: " تفاصيل الموقع",
                icon: Icons.location_on,
                controller: locationController,
              ),


              const SizedBox(height: 20),

              BottumAuth(
                title: "حفظ",
                onPressed: () {},
              ),

            ],
          ),
        ),
      ),
    );
  }


}
