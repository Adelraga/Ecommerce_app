import 'package:ecommerce/Features/Auth/presentation/pages/Form/view/Form_view.dart';
import 'package:ecommerce/Features/Auth/presentation/pages/login/model_view/cubit/login_cubit/login_cubit.dart';
import 'package:ecommerce/Features/Auth/presentation/pages/login/view/widget/customTextField.dart';
import 'package:ecommerce/Features/Auth/presentation/pages/login/view/widget/custombutton.dart';
import 'package:ecommerce/Features/Auth/presentation/pages/SignUp/view/sign%20up_view.dart';
import 'package:ecommerce/Features/BottomNavigator/presentation/view/bomttom_nav.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class CutomForm extends StatefulWidget {
  CutomForm({super.key});

  @override
  State<CutomForm> createState() => _CutomFormState();
}

class _CutomFormState extends State<CutomForm> {
  String? email;

  String? password;

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
      listener: (context, state) {
         if(state is LoginLoading){
        
       }
       else if( state is LoginSuccess){
           Navigator.push(context,
                MaterialPageRoute(builder: (context) {
                     return FormView();
                    }));
                     
       }
        else if(state is LoginFailure){
          Showsnackbar(context, state.errMessage);
         
        }
      },
      builder: (context, state) {
        return Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Customformtextfield(
                  onChanged: (data) {
                    email = data;
                  },
                  hintText: 'Email Address',
                ),
                SizedBox(
                  height: 30,
                ),
                Customformtextfield(
                  onChanged: (data) {
                    password = data;
                  },
                  hintText: 'Password',
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Color.fromARGB(255, 97, 97, 97)),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpView();
                        }));
                      },
                      child: Text('Sign Up',
                          style: TextStyle(
                              color: Color.fromARGB(255, 97, 97, 97))),
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Custombutton(
                  backgroundColor: Colors.orange.shade900,
                  width: MediaQuery.of(context).size.width * .6,
                  height: MediaQuery.of(context).size.width * .12,
                  btnname: 'Login',
                  pressed: () {
                    if (formKey.currentState!.validate()) {
                      BlocProvider.of<LoginCubit>(context).loginUser(email: email!,password: password!);
                      
                    } else {
                      //autovalidateMode = AutovalidateMode.always;
                      
                    }
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Text('continue with social media',
                    style: TextStyle(color: Color.fromARGB(255, 97, 97, 97))),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Custombutton(
                      backgroundColor: const Color.fromARGB(255, 4, 127, 227),
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.width * .15,
                      btnname: 'Facebook',
                      pressed: () async {},
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Custombutton(
                      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                      width: MediaQuery.of(context).size.width * .4,
                      height: MediaQuery.of(context).size.width * .15,
                      btnname: 'Github',
                      pressed: () async {},
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void Showsnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
    ));
  }
}
