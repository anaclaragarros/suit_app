import 'package:flutter/material.dart';
import 'package:suit_app/models/credit_limit_edit.dart';
import 'package:suit_app/utils/auth_header.dart';
import 'package:suit_app/utils/responsive_utils.dart';
import 'package:suit_app/widgets/search_field.dart';

class CreditLimitHistoryScreen extends StatefulWidget {
  const CreditLimitHistoryScreen({super.key});

  @override
  State<CreditLimitHistoryScreen> createState() => _CreditLimitHistoryScreenState();
}

class _CreditLimitHistoryScreenState extends State<CreditLimitHistoryScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<CreditLimitEdit> _edits = [];


  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadEdits() {
    _edits = [
      CreditLimitEdit(
        id: '1',
        clientId: '1',
        changeDate: '',
        userId: '',
        oldLimit: 50,
        newLimit: 50,

      ),
      CreditLimitEdit(
        id: '2',
        clientId: '2',
        changeDate: '',
        userId: '',
        oldLimit: 50,
        newLimit: 50,
      ),
      CreditLimitEdit(
        id: '3',
        clientId: '3',
        changeDate: '',
        userId: '',
        oldLimit: 50,
        newLimit: 50,
      ),
    ];
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
              title: 'Histórico de Edições',
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(6)),
                child: Column(
                  children: [
                    SizedBox(height: responsive.hp(3)),
                    _buildSearchField(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return SearchField(
      controller: _searchController,
      placeholder: 'Buscar por cliente ou usuário...',
    );
  }


  Widget _buildEmptyState() {
    final responsive = ResponsiveUtils(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.history,
            size: responsive.sp(48),
            color: Colors.grey[400],
          ),
          SizedBox(height: responsive.hp(2)),
          Text(
            'Nenhuma edição encontrada',
            style: TextStyle(
              fontSize: responsive.sp(16),
              color: Colors.grey[600],
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}