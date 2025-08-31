import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:suit_app/models/clients.dart';
import 'package:suit_app/utils/auth_header.dart';
import 'package:suit_app/utils/currency_formatter.dart';
import 'package:suit_app/utils/responsive_utils.dart';
import 'package:suit_app/widgets/custom_button.dart';
import 'package:suit_app/widgets/custom_text_field.dart';

class EditCreditLimitScreen extends StatefulWidget {
  final Client client;

  const EditCreditLimitScreen({
    super.key,
    required this.client,
  });

  @override
  State<EditCreditLimitScreen> createState() => _EditCreditLimitScreenState();
}

class _EditCreditLimitScreenState extends State<EditCreditLimitScreen> {
  final TextEditingController _creditLimitController = TextEditingController();
  final TextEditingController _reasonController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    // CORREÇÃO: Chamando o método estático diretamente da classe
    _creditLimitController.text = CurrencyFormatter.format(widget.client.creditLimit);
  }

  @override
  void dispose() {
    _creditLimitController.dispose();
    _reasonController.dispose();
    super.dispose();
  }

  void _handleSave() {
    if (_formKey.currentState!.validate()) {
      _showSuccessDialog();
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sucesso'),
        content: const Text('Limite de crédito atualizado com sucesso!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.of(context).pop();
            },
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final responsive = ResponsiveUtils(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            const AuthHeader(
              showBackButton: true,
              title: 'Editar Limite',
            ),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(6)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: responsive.hp(3)),
                      _buildClientInfo(responsive),
                      SizedBox(height: responsive.hp(4)),
                      _buildCurrentLimitInfo(responsive),
                      SizedBox(height: responsive.hp(3)),
                      _buildNewLimitField(),
                      SizedBox(height: responsive.hp(3)),
                      _buildReasonField(),
                      SizedBox(height: responsive.hp(4)),
                      _buildSaveButton(responsive),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildClientInfo(ResponsiveUtils responsive) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informações do Cliente',
            style: TextStyle(
              fontSize: responsive.sp(16),
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: responsive.hp(1.5)),
          _buildInfoRow('Nome:', widget.client.name, responsive),
          SizedBox(height: responsive.hp(0.5)),
          _buildInfoRow('Email:', widget.client.email, responsive),
          ],
      ),
    );
  }

  Widget _buildInfoRow(String label, String value, ResponsiveUtils responsive) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: responsive.wp(20),
          child: Text(
            label,
            style: TextStyle(
              fontSize: responsive.sp(14),
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
        ),
        Expanded(
          child: Text(
            value,
            style: TextStyle(
              fontSize: responsive.sp(14),
              color: Colors.black87,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrentLimitInfo(ResponsiveUtils responsive) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(responsive.wp(4)),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blue[200]!),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Limite Atual',
            style: TextStyle(
              fontSize: responsive.sp(14),
              fontWeight: FontWeight.w500,
              color: Colors.blue[700],
            ),
          ),
          SizedBox(height: responsive.hp(0.5)),
          Text(
            CurrencyFormatter.format(widget.client.creditLimit),
            style: TextStyle(
              fontSize: responsive.sp(24),
              fontWeight: FontWeight.w700,
              color: Colors.blue[800],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewLimitField() {
    return CustomTextField(
      controller: _creditLimitController,
      label: 'Novo Limite de Crédito',
      placeholder: 'R\$ 0,00',
      keyboardType: TextInputType.number,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        CurrencyInputFormatter(),
      ],
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Por favor, insira o novo limite';
        }
        final numericValue = CurrencyFormatter.parseToDouble(value);
        if (numericValue <= 0) {
          return 'O limite deve ser maior que zero';
        }
        return null;
      },
    );
  }

  Widget _buildReasonField() {
    return CustomTextField(
      controller: _reasonController,
      label: 'Motivo da Alteração (Opcional)',
      placeholder: 'Descreva o motivo da alteração...',
      inputFormatters: [],
    );
  }

  Widget _buildSaveButton(ResponsiveUtils responsive) {
    return CustomButton(
      text: 'Salvar Alteração',
      onPressed: _handleSave,
      width: double.infinity,
      height: responsive.hp(6.5),
    );
  }
}