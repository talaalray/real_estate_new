import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/blocs/login/login_cubit.dart';
import 'package:real_estate/constans/image_url.dart';
import 'package:real_estate/crud.dart';
import 'package:real_estate/screens/auth/signup.dart';
import 'package:real_estate/widgets/auth/bottum_go.dart';
import 'package:real_estate/widgets/auth/bouttom_auth.dart';
import '../../blocs/signup/signup_state.dart';
import '../../constans/color.dart';
import '../../widgets/auth/custom_input_field.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final email = TextEditingController();
  final password = TextEditingController();

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(Crud()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<LoginCubit, SignupState>(
          listener: (context, state) {
            if (state is SignupSuccess) {
              Navigator.of(context).pushNamedAndRemoveUntil("home", (route) => false);
            } else if (state is SignupFailure) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.error)),
              );
            }
          },
          builder: (context, state) {
            if (state is SignupLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                const SizedBox(height: 60),
                Center(
                  child: Image.asset(AppImageAsset.login),
                ),
                const SizedBox(height: 10),
                const Center(
                  child: Text(
                    'تسجيل الدخول',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                CustomInputField(
                  controller: email,
                  label: 'البريد الإلكتروني',
                  hintText: 'ادخل بريدك الإلكتروني',
                  icon: Icons.email,
                ),
                const SizedBox(height: 20),
                CustomInputField(
                  controller: password,
                  label: 'كلمة المرور',
                  hintText: 'ادخل كلمة المرور',
                  icon: Icons.lock,
                  obscureText: true,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: TextButton(
                    onPressed: () {},
                    child:  Text(
                      'هل نسيت كلمة المرور؟',
                      style: TextStyle(
                        color: AppColor.grey2,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                BottumAuth(
                  title: "تسجيل الدخول",
                  onPressed: () {
                    BlocProvider.of<LoginCubit>(context).login(
                      email: email.text,
                      password: password.text,
                    );
                  },
                ),
                const SizedBox(height: 20),
                BottumGo(
                  questionText: "ليس لديك حساب؟ ",
                  actionText: "إنشاء حساب",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (_) => const Signup()),
                    );
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
