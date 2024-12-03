import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_training/controller/signup/signup_cubit.dart';
import 'package:project_training/core/components/custom_container.dart';
import 'package:project_training/core/components/custom_pop.dart';
import 'package:project_training/core/styles/styles.dart';
import 'package:project_training/view/signup/widgets/custom_emailcreate.dart';
import 'package:project_training/view/signup/widgets/custom_firstname.dart';
import 'package:project_training/view/signup/widgets/custom_lastname.dart';
import 'package:project_training/view/signup/widgets/custom_passcreate.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firtnamecontroller = TextEditingController();
    return Scaffold(
      body: BlocBuilder<SignupCubit, SignupState>(
        builder: (context, state) {
          final cubit = context.read<SignupCubit>();
    
          if (state is SignupSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Account created successfully!')),
              );
    
            });
            //!
          }
    
          if (state is SignupError) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(state.message)),
              );
            });
          }
    
          return Form(
            key: cubit.formKey,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 27),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 63),
                    CustomPop(
                      ontap: () {
                        Navigator.pop(context);
                      },
                    ),
                    const SizedBox(height: 20),
                    Text("Create Account", style: TextStyles.font32black),
                    const SizedBox(height: 30),
                    CustomFirstname(firstname: firtnamecontroller,),
                    const SizedBox(height: 16),
                    CustomLastname(),
                    const SizedBox(height: 16),
                    CustomEmailcreate(emailController: emailController,),
                    const SizedBox(height: 16),
                    CustomPasscreate(passwordController: passwordController,),
                    const SizedBox(height: 40),
                    CustomContainer(
                      name: "Create Account",
                      ontap: () {
                        cubit.validateAndSubmit();
                        cubit.createAccountFirebase(email: emailController.text, password: passwordController.text, context: context);
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
