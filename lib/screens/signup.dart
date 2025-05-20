import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_estate/blocs/signup/signup_state.dart';
import 'package:real_estate/crud.dart';
import 'package:real_estate/widgets/auth/bottum_go.dart';
import 'package:real_estate/widgets/auth/bouttom_auth.dart';
import '../blocs/signup/signup_cubit.dart';
import '../widgets/auth/text_field.dart';

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
                  Container(
                    width: double.infinity,
                    decoration: const ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        side: BorderSide(
                          width: 1,
                          strokeAlign: BorderSide.strokeAlignCenter,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  TextFiledWidgets(
                    labelText: "اسم المستخدم",
                    hintText: "ادخل اسم المستخدم",
                    icon: Icons.person,
                    controller: name,
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  TextFiledWidgets(
                    labelText: "البريد الالكتروني",
                    hintText: "ادخل البريد الالكتروني",
                    icon: Icons.email,
                    controller: email,
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  TextFiledWidgets(
                    labelText: "كلمة المرور",
                    hintText: "ادخل كلمة المرور",
                    icon: Icons.lock,
                    iconShow: Icons.remove_red_eye_outlined,
                    controller: password,
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  TextFiledWidgets(
                    labelText: "تأكيد كلمة المرور",
                    hintText: "اعد ادخال كلمة المرور",
                    icon: Icons.lock,
                    iconShow: Icons.remove_red_eye_outlined,
                    controller: passwordConfirmation,
                    isNumber: false,
                  ),
                  const SizedBox(height: 20),
                  TextFiledWidgets(
                    labelText: "رقم الهاتف",
                    hintText: "ادخل رقم الهاتف",
                    icon: Icons.phone_android,
                    controller: phoneNumber,
                    isNumber: true,
                  ),
                  const SizedBox(height: 30),
                  BottumAuth(
                    text: "انشاء حساب",
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
                  BottomGoToWidget(
                    text: "لديك حساب ؟ ",
                    buttom: "تسجيل الدخول",
                    onPressed: () {
                      // Navigator.push(context, MaterialPageRoute(builder: (_) => Login()));
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
