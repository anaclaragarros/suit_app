
import 'package:suit_app/models/update_credit_limit_request_entity.dart';

abstract interface class CreditLimitHistoryRepository {

  Future <List <UpdateCreditLimitRequestEntity>> listAll ();

}