import 'package:flutter/material.dart';
import 'package:suit_app/controller/login_controller.dart';
import 'package:suit_app/utils/auth_header.dart';
import 'package:suit_app/utils/responsive_utils.dart';
import 'package:suit_app/widgets/custom_button.dart';
import 'package:suit_app/widgets/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final loginController = LoginController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _handleLogin() async {
    if (_formKey.currentState!.validate()) {
      final user = await loginController.login(_emailController.text);
      print(user.role.name);
      print(user.name);
      print(user.id);
    }
  }

  void _navigateToSignUp() {
    Navigator.pushNamed(context, '/signup');
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const AuthHeader(showBackButton: false, title: ''),
            Container(
              margin: EdgeInsets.only(top: responsive.hp(2)),
              padding: EdgeInsets.symmetric(
                horizontal: responsive.wp(8),
                vertical: responsive.hp(4),
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildTitle(responsive),
                    SizedBox(height: responsive.hp(4)),
                    _buildEmailField(),
                    SizedBox(height: responsive.hp(4)),
                    _buildLoginButton(responsive),
                    SizedBox(height: responsive.hp(3)),
                    _buildSignUpLink(responsive),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(ResponsiveUtils responsive) {
    return Center(
      child: Text(
        'Login',
        style: TextStyle(
          fontSize: responsive.sp(20),
          fontWeight: FontWeight.w600,
          color: Colors.black87,
        ),
      ),
    );
  }

  Widget _buildEmailField() {
    return CustomTextField(
      controller: _emailController,
      label: 'Email',
      placeholder: 'example@gmail.com',
      keyboardType: TextInputType.emailAddress,
      inputFormatters: [],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Insira seu e-mail';
        }
        return null;
      },
    );
  }



  Widget _buildLoginButton(ResponsiveUtils responsive) {
    return CustomButton(
      text: 'Login',
      onPressed: _handleLogin,
      width: double.infinity,
      height: responsive.hp(6.5),
    );
  }

  Widget _buildSignUpLink(ResponsiveUtils responsive) {
    return Center(
      child: GestureDetector(
        onTap: _navigateToSignUp,
        child: RichText(
          text: TextSpan(
            style: TextStyle(
              fontSize: responsive.sp(14),
              color: Colors.grey[600],
            ),
            children: [
              const TextSpan(text: "Não tem uma conta? "),
              TextSpan(
                text: 'Cadastre-se',
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
