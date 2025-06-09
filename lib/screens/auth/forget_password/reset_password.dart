// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:real_estate/constans/image_url.dart';
// import 'package:real_estate/crud.dart';
// import 'package:real_estate/function/validators.dart';
// import 'package:real_estate/screens/auth/signup.dart';
// import 'package:real_estate/widgets/auth/bottum_go.dart';
// import 'package:real_estate/widgets/auth/bouttom_auth.dart';
// import '../../../constans/color.dart';
// import '../../../widgets/auth/custom_input_field.dart';
//
//
// class Login extends StatefulWidget {
//   const Login({super.key});
//
//   @override
//   State<Login> createState() => _LoginState();
// }
// class _LoginState extends State<Login> {
//   final _formKey = GlobalKey<FormState>();
//   final password = TextEditingController();
//   final confirm_password = TextEditingController();
//
//   @override
//   void dispose() {
//     email.dispose();
//     password.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     // return BlocProvider(
//     //   create: (_) => LoginCubit(Crud()),
//     //   child: Scaffold(
//     //     backgroundColor: Colors.white,
//     //     body: BlocConsumer<LoginCubit, LoginState>(
//     //       listener: (context, state) {
//     //         if (state is LoginSuccess) {
//     //           Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
//     //         } else if (state is LoginFailure) {
//     //           ScaffoldMessenger.of(context).showSnackBar(
//     //             SnackBar(content: Text(state.error)),
//     //           );
//     //         }
//     //       },
//     //       builder: (context, state) {
//     //         if (state is LoginLoading) {
//     //           return const Center(child: CircularProgressIndicator());
//     //         }
//             return ListView(
//               padding: const EdgeInsets.all(20),
//               children: [
//                 const SizedBox(height: 60),
//                 Center(
//                   child: Image.asset(AppImageAsset.login),
//                 ),
//                 const SizedBox(height: 10),
//                  Text(
//                     'تعديل كلمة المرور',
//                     style: TextStyle(
//                       fontSize: 40,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//
//                 const SizedBox(height: 30),
//                 Form(  // <-- أضف Form هنا
//                   key: _formKey,
//                   child: Column(
//                     children: [
//                       CustomInputField(
//                         controller: password,
//                         label: 'كلمة المرور الجديدة',
//                         hintText: 'ادخل كلمة المرور الجديدة',
//                         icon: Icons.lock,
//                         isPassword: true,
//                         validator: Validators.validatePassword,
//                       ),
//                       const SizedBox(height: 20),
//                       CustomInputField(
//                         controller: confirm_password,
//                         label: 'تأكيد كلمة المرور',
//                         hintText: 'اعد إدخال كلمة المرور',
//                         icon: Icons.lock,
//                         isPassword: true,
//                         validator: (value) =>
//                             Validators.validatePasswordConfirmation(value, password.text),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: TextButton(
//                     onPressed: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(builder: (_) => const Signup()),
//                       );
//                     },
//                     child: Text(
//                       'هل نسيت كلمة المرور؟',
//                       style: TextStyle(
//                         color: AppColor.grey2,
//                         fontWeight: FontWeight.w500,
//                       ),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(height: 30),
//                 BottumAuth(
//                   title: "تسجيل الدخول",
//                   onPressed: () {
//                     if (_formKey.currentState!.validate()) {
//                       BlocProvider.of<LoginCubit>(context).login(
//                         email: email.text,
//                         password: password.text,
//                       );
//                     }
//                   },
//                 ),
//                 const SizedBox(height: 20),
//                 BottumGo(
//                   questionText: "ليس لديك حساب؟ ",
//                   actionText: "إنشاء حساب",
//                   onPressed: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (_) => const Signup()),
//                     );
//                   },
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
