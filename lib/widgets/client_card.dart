import 'package:flutter/material.dart';
import 'package:suit_app/models/clients.dart';
import 'package:suit_app/utils/currency_formatter.dart';
import 'package:suit_app/utils/responsive_utils.dart';

class ClientCard extends StatelessWidget {
  final Client client;
  final VoidCallback onTap;

  const ClientCard({
    super.key,
    required this.client,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Container(
      margin: EdgeInsets.only(bottom: responsive.hp(1.5)),
      child: Material(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        elevation: 0,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            padding: EdgeInsets.all(responsive.wp(4)),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey[200]!),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                _buildAvatar(responsive),
                SizedBox(width: responsive.wp(3)),
                Expanded(child: _buildClientInfo(responsive)),
                _buildCreditLimit(responsive),
                SizedBox(width: responsive.wp(2)),
                Icon(
                  Icons.arrow_forward_ios,
                  size: responsive.sp(16),
                  color: Colors.grey[400],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAvatar(ResponsiveUtils responsive) {
    return Container(
      width: responsive.wp(12),
      height: responsive.wp(12),
      decoration: BoxDecoration(
        color: Colors.black87,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text(
          client.name.substring(0, 1).toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: responsive.sp(18),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _buildClientInfo(ResponsiveUtils responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          client.name,
          style: TextStyle(
            fontSize: responsive.sp(16),
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        SizedBox(height: responsive.hp(0.3)),
        Text(
          client.email,
          style: TextStyle(
            fontSize: responsive.sp(13),
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: responsive.hp(0.2)),
      ],
    );
  }

  Widget _buildCreditLimit(ResponsiveUtils responsive) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text(
          'Limite',
          style: TextStyle(
            fontSize: responsive.sp(12),
            color: Colors.grey[600],
          ),
        ),
        SizedBox(height: responsive.hp(0.3)),
        Text(
          CurrencyFormatter.format(client.creditLimit),
          style: TextStyle(
            fontSize: responsive.sp(14),
            fontWeight: FontWeight.w600,
            color: Colors.green[700],
          ),
        ),
      ],
    );
  }
}