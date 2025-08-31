import 'package:flutter/material.dart';
import 'package:suit_app/utils/auth_header.dart';
import 'package:suit_app/utils/responsive_utils.dart';
import 'package:suit_app/widgets/custom_button.dart';
import 'package:suit_app/widgets/custom_text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleSignUp() {
    print('Sign Up: ${_emailController.text}');
  }

  void _navigateToLogin() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AuthHeader(
                showBackButton: true,
                title: '',
                onBackPressed: _navigateToLogin,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: responsive.wp(8),
                  vertical: responsive.hp(3),
                ),
                child: Column(
                  children: [
                    SizedBox(height: responsive.hp(2)),
                    _buildFirstNameField(),
                    SizedBox(height: responsive.hp(2.5)),
                    _buildLastNameField(),
                    SizedBox(height: responsive.hp(2.5)),
                    _buildEmailField(),
                    SizedBox(height: responsive.hp(2.5)),
                    _buildPasswordField(),
                    SizedBox(height: responsive.hp(2.5)),
                    _buildConfirmPasswordField(),
                    SizedBox(height: responsive.hp(4)),
                    _buildSignUpButton(responsive),
                    SizedBox(height: responsive.hp(3)),
                    _buildSignInLink(responsive),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFirstNameField() {
    return CustomTextField(
      controller: _firstNameController,
      label: 'Nome',
      placeholder: '',
      inputFormatters: [],
    );
  }

  Widget _buildLastNameField() {
    return CustomTextField(
      controller: _lastNameController,
      label: 'Sobrenome',
      placeholder: '',
      inputFormatters: [],
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      label: 'Email',
      placeholder: 'example@gmail.com',
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [],
    );
  }

  Widget _buildPasswordField() {
    return CustomTextField(
      controller: _passwordController,
      label: 'Senha',
      placeholder: '••••••••',
      isPassword: true,
      inputFormatters: [],
    );
  }

  Widget _buildConfirmPasswordField() {
    return CustomTextField(
      controller: _confirmPasswordController,
      label: 'Confirme sua senha',
      placeholder: '••••••••',
      isPassword: true,
      inputFormatters: [],
    );
  }

  Widget _buildSignUpButton(ResponsiveUtils responsive) {
    return CustomButton(
      text: 'Sign Up',
      onPressed: _handleSignUp,
      width: double.infinity,
      height: responsive.hp(6.5),
    );
  }

  Widget _buildSignInLink(ResponsiveUtils responsive) {
    return Center(
      child: GestureDetector(
        onTap: _navigateToLogin,
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: responsive.sp(14),
              color: Colors.grey[600],
            ),
            children: [
              const TextSpan(text: "Ainda não possui conta? "),
              TextSpan(
                text: 'Faça sua conta',
                style: TextStyle(
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}