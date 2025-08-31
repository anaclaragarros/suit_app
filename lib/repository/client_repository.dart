import 'package:suit_app/models/clients.dart';

abstract interface class ClientRepository {

  Future <List <Client>> listAll ();
  Future <Client> updateCreditLimit ();



}