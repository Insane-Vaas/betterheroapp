import 'package:betterheroapp/httpRequests/onboardingbackend.dart';
import 'package:betterheroapp/model/usermodel/usermodel.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController emailIDController = TextEditingController();
  TextEditingController userGenderController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.all(8),
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        children: [
          firstNameWidget(firstNameController),
          lastNameWidget(lastNameController),
          phoneNumberWidget(phoneNumberController),
          emailIdWidget(emailIDController),
          genderWidget(userGenderController),
          ElevatedButton(
            onPressed: () {
              UserModel user = new UserModel(
                userEmailID: emailIDController.text,
                userFirstName: firstNameController.text,
                userGender: userGenderController.text,
                userLastName: lastNameController.text,
                userPhoneNumber: phoneNumberController.text,
                userUID: FirebaseAuth.instance.currentUser!.uid,
              );
              var res = OnBoardingBackend().postUserData(user);
              print(res);
              context.goNamed('home');
            },
            child: Text(
              "Submit",
            ),
          ),
        ],
      ),
    );
  }
}

TextFormField firstNameWidget(TextEditingController textEditingController) {
  return TextFormField(
    controller: textEditingController,
  );
}

TextFormField lastNameWidget(TextEditingController textEditingController) {
  return TextFormField(
    controller: textEditingController,
  );
}

TextFormField phoneNumberWidget(TextEditingController textEditingController) {
  return TextFormField(
    controller: textEditingController,
  );
}

TextFormField emailIdWidget(TextEditingController textEditingController) {
  return TextFormField(
    decoration: InputDecoration(
      hintText: FirebaseAuth.instance.currentUser?.email,
      hintStyle: TextStyle(
        color: Colors.black,
      ),
    ),
    controller: textEditingController,
  );
}

TextFormField genderWidget(TextEditingController textEditingController) {
  return TextFormField(
    controller: textEditingController,
  );
}
