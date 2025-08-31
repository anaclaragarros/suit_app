import 'package:flutter/material.dart';
import 'package:suit_app/utils/responsive_utils.dart';

class AuthHeader extends StatelessWidget {
  final bool showBackButton;
  final String title;
  final VoidCallback? onBackPressed;

  const AuthHeader({
    super.key,
    required this.showBackButton,
    required this.title,
    this.onBackPressed,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Container(
      width: double.infinity,
      height: responsive.hp(25),
      decoration: const BoxDecoration(
        color: Colors.black87,
      ),
      child: Stack(
        children: [
          _buildGeometricPattern(),
          _buildContent(context, responsive),
        ],
      ),
    );
  }

  Widget _buildGeometricPattern() {
    return Positioned.fill(
      child: CustomPaint(
        painter: GeometricPatternPainter(),
      ),
    );
  }

  Widget _buildContent(BuildContext context, ResponsiveUtils responsive) {
    return Positioned.fill(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: responsive.wp(6)),
          child: Column(
            children: [
              if (showBackButton) _buildHeader(context, responsive),
              const Spacer(),
              if (!showBackButton) _buildLogo(responsive),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, ResponsiveUtils responsive) {
    return Row(
      children: [
        GestureDetector(
          onTap: onBackPressed ?? () => Navigator.pop(context),
          child: Container(
            padding: const EdgeInsets.all(8),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: responsive.sp(20),
            ),
          ),
        ),
        Expanded(
          child: Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.white,
              fontSize: responsive.sp(18),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        SizedBox(width: responsive.wp(10)),
      ],
    );
  }

  Widget _buildLogo(ResponsiveUtils responsive) {
    return Container(
      width: responsive.wp(15),
      height: responsive.wp(15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Image.asset(
          'assets/images/SuitPay.png',
          width: responsive.wp(12),
          height: responsive.wp(12),
        ),
      ),
    );
  }
}

class GeometricPatternPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.white.withOpacity(0.05)
      ..style = PaintingStyle.fill;

    for (int i = 0; i < 10; i++) {
      for (int j = 0; j < 10; j++) {
        final rect = Rect.fromLTWH(
          (size.width / 10) * i,
          (size.height / 10) * j,
          size.width / 20,
          size.height / 20,
        );

        if ((i + j) % 3 == 0) {
          canvas.drawRect(rect, paint);
        }
      }
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}