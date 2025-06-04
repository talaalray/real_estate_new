// import 'package:flutter/material.dart';
// import 'package:real_estate/constans/color.dart';
// import 'package:real_estate/constans/image_url.dart';
// import 'package:real_estate/screens/auth/signup.dart';
// import 'package:real_estate/widgets/auth/bottum_go.dart';
// import '../../widgets/auth/bouttom_auth.dart';
// import '../../widgets/auth/custom_input_field.dart'; // غيّر المسار حسب مشروعك
//
// class ResetPassword extends StatelessWidget {
//   const ResetPassword({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: SafeArea(
//         child: SingleChildScrollView(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Center(
//                 child: Image.asset(
//                   AppImageAsset.reset_password,
//                   height: 200,
//                 ),
//               ),
//               const SizedBox(height: 30),
//               const Center(
//                 child: Text(
//                   'تعديل كلمة السر',
//                   style: TextStyle(
//                     fontSize: 40,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//               const SizedBox(height: 40),
//
//               // ✅ إدخال البريد
//               const CustomInputField(
//                 label: 'كلمة المرور الجديدة',
//                 hintText: 'ادخل بريدك الإلكتروني',
//                 icon: Icons.email,
//               ),
//               const SizedBox(height: 10),
//
//               // ✅ إدخال كلمة المرور
//               const CustomInputField(
//                 label: 'كلمة المرور',
//                 hintText: 'ادخل كلمة المرور',
//                 icon: Icons.lock,
//                 obscureText: true,
//               ),
//
//               //const SizedBox(height: 5),
//               Align(
//                 alignment: Alignment.centerLeft,
//                 child: TextButton(
//                   onPressed: () {},
//                   child:  Text(
//                     'هل نسيت كلمة المرور؟',
//                     style: TextStyle(
//                       color: AppColor.grey2,
//                       fontWeight: FontWeight.w500,
//                     ),
//                   ),
//                 ),
//               ),
//
//               const SizedBox(height: 30),
//               BottumAuth(
//                 title: 'تسجيل الدخول',
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
//                 },
//               ),
//
//               const SizedBox(height: 30),
//               BottumGo(
//                 questionText: 'ليس لديك حساب؟',
//                 actionText: 'إنشاء حساب',
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(builder: (_) => Signup()));
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
