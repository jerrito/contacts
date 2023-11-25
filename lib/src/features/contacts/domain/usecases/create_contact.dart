import 'package:contacts/core/usecases/usecases.dart';
import 'package:contacts/src/features/contacts/domain/entities/contact.dart';
import 'package:contacts/src/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

class CreateContact extends UseCases<Contact, Map<String, dynamic>> {
  final ContactsRepository repository;

  CreateContact({required this.repository});

  @override
  Future<Either<String, Contact>> call(Map<String, dynamic> params) async {
    return await repository.createContact(params);
  }
}
