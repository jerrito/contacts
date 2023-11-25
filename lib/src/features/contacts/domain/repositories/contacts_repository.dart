import 'package:contacts/src/features/contacts/domain/entities/contact.dart';
import 'package:dartz/dartz.dart';

abstract class ContactsRepository {
  Future<Either<String, Contact>> createContact(Map<String, dynamic> params);
  Future<Either<String, Contact>> updateContact(Map<String, dynamic> params);
  Future<Either<String, Contact>> deleteContact(Map<String, dynamic> params);
  Future<Either<String, List<Contact>>> getAllContact(
      );
}
