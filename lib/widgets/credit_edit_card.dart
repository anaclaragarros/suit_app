import 'package:flutter/material.dart';
import 'package:suit_app/utils/currency_formatter.dart';
import 'package:suit_app/utils/date_formatter.dart';
import 'package:suit_app/utils/responsive_utils.dart';

class CreditEditCardModel {
  final double newLimit;
  final double previousLimit;
  final String? reason;
  final String clientName;
  final String editedBy;
  final DateTime editedAt;

  const CreditEditCardModel({
    required this.newLimit,
    required this.previousLimit,
    this.reason,
    required this.clientName,
    required this.editedBy,
    required this.editedAt,
  });

}

class CreditEditCard extends StatelessWidget {
  final CreditEditCardModel edit;

  const CreditEditCard({
    super.key,
    required this.edit,
  });

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);
    final isIncrease = edit.newLimit > edit.previousLimit;

    return Container(
      margin: EdgeInsets.only(bottom: responsive.hp(1.5)),
      padding: EdgeInsets.all(responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey[200]!),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(responsive),
          SizedBox(height: responsive.hp(1.5)),
          _buildLimitChange(responsive, isIncrease),
          if (edit.reason != null) ...[
            SizedBox(height: responsive.hp(1)),
            _buildReason(responsive),
          ],
          SizedBox(height: responsive.hp(1)),
          _buildFooter(responsive),
        ],
      ),
    );
  }

  Widget _buildHeader(ResponsiveUtils responsive) {
    return Row(
      children: [
        Container(
          width: responsive.wp(10),
          height: responsive.wp(10),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Center(
            child: Text(
              edit.clientName.substring(0, 1).toUpperCase(),
              style: TextStyle(
                color: Colors.white,
                fontSize: responsive.sp(16),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        SizedBox(width: responsive.wp(3)),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                edit.clientName,
                style: TextStyle(
                  fontSize: responsive.sp(16),
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              Text(
                'Editado por ${edit.editedBy}',
                style: TextStyle(
                  fontSize: responsive.sp(13),
                  color: Colors.grey[600],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLimitChange(ResponsiveUtils responsive, bool isIncrease) {
    return Container(
      padding: EdgeInsets.all(responsive.wp(3)),
      decoration: BoxDecoration(
        color: isIncrease ? Colors.green[50] : Colors.red[50],
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: isIncrease ? Colors.green[200]! : Colors.red[200]!,
        ),
      ),
      child: Row(
        children: [
          Icon(
            isIncrease ? Icons.trending_up : Icons.trending_down,
            color: isIncrease ? Colors.green[700] : Colors.red[700],
            size: responsive.sp(20),
          ),
          SizedBox(width: responsive.wp(2)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'De ${CurrencyFormatter.format(edit.previousLimit)} para ${CurrencyFormatter.format(edit.newLimit)}',
                  style: TextStyle(
                    fontSize: responsive.sp(14),
                    fontWeight: FontWeight.w600,
                    color: isIncrease ? Colors.green[800] : Colors.red[800],
                  ),
                ),
                Text(
                  '${isIncrease ? '+' : ''}${CurrencyFormatter.format(edit.newLimit - edit.previousLimit)}',
                  style: TextStyle(
                    fontSize: responsive.sp(12),
                    color: isIncrease ? Colors.green[700] : Colors.red[700],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReason(ResponsiveUtils responsive) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsive.wp(3)),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        edit.reason!,
        style: TextStyle(
          fontSize: responsive.sp(13),
          color: Colors.grey[700],
          fontStyle: FontStyle.italic,
        ),
      ),
    );
  }

  Widget _buildFooter(ResponsiveUtils responsive) {
    return Text(
      DateFormatter.formatDateTime(edit.editedAt),
      style: TextStyle(
        fontSize: responsive.sp(12),
        color: Colors.grey[500],
      ),
    );
  }
}