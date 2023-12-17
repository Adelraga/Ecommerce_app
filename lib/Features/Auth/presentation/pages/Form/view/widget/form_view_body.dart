import 'package:ecommerce/Features/Auth/presentation/pages/Form/view/widget/Custom_Date_of_birth_form_field.dart';
import 'package:ecommerce/Features/Auth/presentation/pages/Form/view/widget/custom_gender_form.dart';
import 'package:ecommerce/Features/Auth/presentation/pages/SignUp/view/widget/customTextField.dart';
import 'package:ecommerce/Features/Auth/presentation/pages/SignUp/view/widget/custombutton.dart';
import 'package:ecommerce/Features/BottomNavigator/presentation/view/bomttom_nav.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FormViewBody extends StatefulWidget {
  FormViewBody({super.key});

  @override
  State<FormViewBody> createState() => _FormViewBodyState();
}

class _FormViewBodyState extends State<FormViewBody> {
  String? email;

  String? password;

  bool isLoading = false;

  final formKey = GlobalKey<FormState>();

  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  TextEditingController _nameController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  TextEditingController _ageController = TextEditingController();

  TextEditingController genderController = TextEditingController();

  TextEditingController _DateController = TextEditingController();
  FirebaseFirestore db = FirebaseFirestore.instance;
  FirebaseAuth auth =FirebaseAuth.instance;
  


  // final CollectionReference userDataCollection =
  //     FirebaseFirestore.instance.collection('user-form-data');

  Future<void> sendUserDataToDB() async {
    var currentuser = auth.currentUser;
    try {
      await db.collection('user-form-data').doc(currentuser!.email).set({
        'name': email,
        'phone': _phoneController.text,
        'age': _ageController.text,
        'dateOfBirth': _DateController.text,
        'gender': genderController.text,
      }).then((vale) =>
    print('DocumentSnapshot added '));
      // If data is successfully added, navigate to HomeView or perform any desired action
    } catch (e) {
      // Handle errors here if needed
      print('Error adding user data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 90,
            ),
            Text(
              "Submit the Form to Continue",
              style: TextStyle(fontSize: 18, color: Colors.orange.shade900),
            ),
            Text("---------------------------------------------"),
            SizedBox(height: 50),
            Form(
              key: formKey,
              autovalidateMode: autovalidateMode,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Customformtextfield(
                      onChanged: (data) {
                        email = data;
                      },
                      controller: _nameController,
                      hintText: 'User Name',
                      keyboardType: TextInputType.name,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Customformtextfield(
                      onChanged: (data) {
                        password = data;
                      },
                      obscureText: true,
                      hintText: 'Phone',
                      keyboardType: TextInputType.phone,
                      controller: _phoneController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Customformtextfield(
                      onChanged: (data) {
                        password = data;
                      },
                      controller: _ageController,
                      hintText: 'Age',
                      keyboardType: TextInputType.number,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomDateOfBirthFormField(
                      onChanged: (data) {
                        password = data;
                      },
                      hintText: 'Date of Birth',
                      keyboardType: TextInputType.datetime,
                      controller: _DateController,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    CustomGenderForm(
                      controller: genderController,
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Custombutton(
                      backgroundColor: Colors.orange.shade900,
                      width: MediaQuery.of(context).size.width * .8,
                      height: MediaQuery.of(context).size.width * .12,
                      btnname: 'Login',
                      pressed: () {
                        if (formKey.currentState!.validate()) {
                          sendUserDataToDB();
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return HomeView();
                          }));
                        }
                      },
                    ),
                    SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
