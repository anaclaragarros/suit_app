import 'package:flutter/material.dart';
import 'package:suit_app/models/clients.dart';
import 'package:suit_app/screens/edit_credit_limit_screen.dart';
import 'package:suit_app/utils/auth_header.dart';
import 'package:suit_app/utils/responsive_utils.dart';
import 'package:suit_app/widgets/client_card.dart';
import 'package:suit_app/widgets/search_field.dart';

class ClientsListScreen extends StatefulWidget {
  const ClientsListScreen({super.key});

  @override
  State<ClientsListScreen> createState() => _ClientsListScreenState();
}

class _ClientsListScreenState extends State<ClientsListScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Client> _clients = [];
  List<Client> _filteredClients = [];

  @override
  void initState() {
    super.initState();
    _loadClients();
    _searchController.addListener(_filterClients);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _loadClients() {
    _clients = [
      Client(
        id: '1',
        name: 'João Silva',
        email: 'joao@email.com',
        cpf: '',
        creditLimit: 50,
        isVip: true,

      ),
      Client(
        id: '2',
        name: 'Maria Santos',
        email: 'maria@email.com',
       cpf: '',
        creditLimit: 50,
        isVip: true,

      ),
      Client(
        id: '3',
        name: 'Pedro Oliveira',
        email: 'pedro@email.com',
        cpf: '',
        creditLimit: 50,
        isVip: true,
      ),
    ];
    _filteredClients = List.from(_clients);
  }

  void _filterClients() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredClients = _clients.where((client) {
        return client.name.toLowerCase().contains(query) ||
            client.email.toLowerCase().contains(query);
      }).toList();
    });
  }

  void _navigateToEditCreditLimit(Client client) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditCreditLimitScreen(client: client),
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
              title: 'Clientes',
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: responsive.wp(6)),
                child: Column(
                  children: [
                    SizedBox(height: responsive.hp(3)),
                    _buildSearchField(),
                    SizedBox(height: responsive.hp(2)),
                    _buildClientsCount(responsive),
                    SizedBox(height: responsive.hp(2)),
                    Expanded(child: _buildClientsList()),
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
      placeholder: 'Buscar cliente...',
    );
  }

  Widget _buildClientsCount(ResponsiveUtils responsive) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        '${_filteredClients.length} cliente(s) encontrado(s)',
        style: TextStyle(
          fontSize: responsive.sp(14),
          color: Colors.grey[600],
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget _buildClientsList() {
    if (_filteredClients.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      itemCount: _filteredClients.length,
      itemBuilder: (context, index) {
        final client = _filteredClients[index];
        return ClientCard(
          client: client,
          onTap: () => _navigateToEditCreditLimit(client),
        );
      },
    );
  }

  Widget _buildEmptyState() {
    final responsive = ResponsiveUtils(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.search_off,
            size: responsive.sp(48),
            color: Colors.grey[400],
          ),
          SizedBox(height: responsive.hp(2)),
          Text(
            'Nenhum cliente encontrado',
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