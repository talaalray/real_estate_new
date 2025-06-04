import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/blocs/signup/signup_state.dart';
import 'package:real_estate/crud.dart';
import 'package:real_estate/widgets/auth/bottum_go.dart';
import 'package:real_estate/widgets/auth/bouttom_auth.dart';
import '../../blocs/signup/signup_cubit.dart';
import '../../widgets/auth/custom_input_field.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final passwordConfirmation = TextEditingController();
  final phoneNumber = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    email.dispose();
    password.dispose();
    passwordConfirmation.dispose();
    phoneNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SignupCubit(Crud()),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: BlocConsumer<SignupCubit, SignupState>(
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
            return Container(
              padding: const EdgeInsets.all(20),
              child: ListView(
                children: [
                  const SizedBox(height: 30),
                  const Center(
                    child: Text(
                      'إنشاء حساب',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  CustomInputField(
                    controller: name,
                    label: 'اسم المستخدم',
                    hintText: 'ادخل اسمك',
                    icon: Icons.person,
                  ),
                  const SizedBox(height: 20),
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
                  const SizedBox(height: 20),
                   CustomInputField(
                     controller: passwordConfirmation,
                    label: 'تأكيد كلمة المرور',
                    hintText: 'اعد إدخال كلمة المرور',
                    icon: Icons.lock,
                    obscureText: true,
                  ),
                  const SizedBox(height: 20),
                   CustomInputField(
                    controller: phoneNumber,
                    label: 'رقم الهاتف',
                    hintText: 'ادخل رقم الهاتف',
                    icon: Icons.phone_android,
                  ),
                  const SizedBox(height: 30),
                  BottumAuth(
                    title: "انشاء حساب",
                    onPressed: () {
                      BlocProvider.of<SignupCubit>(context).signUp(
                        name: name.text,
                        email: email.text,
                        password: password.text,
                        passwordConfirmation: passwordConfirmation.text,
                        phoneNumber: phoneNumber.text,
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  BottumGo(
                    questionText: "لديك حساب ؟ ",
                    actionText: "تسجيل الدخول",
                    onPressed: () {
                       Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
                    },
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
