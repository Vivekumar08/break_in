import 'package:flutter/material.dart';
import '../../components/input_field.dart';
import '../../style/fonts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();

  @override
  void dispose() {
    name.dispose();
    phone.dispose();
    email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leadingWidth: 72.0,
        title: Text("Edit Profile", style: Fonts.appBarTitle),
      ),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InputField(
                inputText: "Name*",
                hintText: "Enter Your Name",
                controller: name),
            InputField(
                inputText: "Phone*",
                hintText: "Enter Your Phone Number",
                controller: phone,
                isPhone: true),
            InputField(
                inputText: "Email*",
                hintText: "Enter Your Email",
                controller: email),
          ],
        ),
      ),
    );
  }
}
