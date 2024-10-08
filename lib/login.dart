import 'package:flutter/material.dart';
import 'package:flutter_application_1/DesignSystem/Components/Buttons/ActionButton/action_button.dart';
import 'package:flutter_application_1/DesignSystem/Components/Buttons/ActionButton/action_button_view_model.dart';
import 'package:flutter_application_1/DesignSystem/Components/InputField/input_text.dart';
import 'package:flutter_application_1/DesignSystem/Components/InputField/input_text_view_model.dart';
import 'package:flutter_application_1/DesignSystem/Components/LinkedLabel/linked_label.dart';
import 'package:flutter_application_1/DesignSystem/Components/LinkedLabel/linked_label_view_model.dart';
import 'package:flutter_application_1/DesignSystem/shared/colors.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: lightTertiaryBaseColorLight,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage('assets/profile_pic.jpg'), // Imagem de perfil
            ),
            SizedBox(height: 20),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: emailController,
                placeholder: 'E-mail',
                password: false,
              ),
            ),
            SizedBox(height: 16),
            StyledInputField.instantiate(
              viewModel: InputTextViewModel(
                controller: passwordController,
                placeholder: 'Password',
                password: true,
                suffixIcon: IconButton(
                  icon: Icon(
                    isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: () {
                    setState(() {
                      isPasswordVisible = !isPasswordVisible;
                    });
                  },
                ),
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerRight,
              child: LinkedLabel.instantiate(
                viewModel: LinkedLabelViewModel(
                  fullText: "Forgot Password",
                  linkedText: "Forgot Password",
                  onLinkTap: () {},
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ActionButton.instantiate(
                viewModel: ActionButtonViewModel(
                  size: ActionButtonSize.large,
                  style: ActionButtonStyle.primary,
                  text: 'Login',
                  onPressed: () {},
                ),
              ),
            ),
            SizedBox(height: 100),
            Center(
              child: Text(
                "Don't Have An Account?",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: darkTertiaryBaseColorDark,
                ),
              ),
            ),
            SizedBox(height: 10),
            ActionButton.instantiate(
              viewModel: ActionButtonViewModel(
                size: ActionButtonSize.medium,
                style: ActionButtonStyle.primary,
                text: 'Register',
                onPressed: () {
                  Navigator.pushNamed(context, '/signup');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
