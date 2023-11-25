import 'package:contacts/core/usecases/usecases.dart';
import 'package:contacts/src/features/contacts/domain/entities/contact.dart';
import 'package:contacts/src/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

class GetAllContacts extends UseCases<List<Contact>, NoParams> {
  final ContactsRepository repository;

  GetAllContacts({required this.repository});
  @override
  Future<Either<String, List<Contact>>> call(NoParams params ) async {
    return await repository.getAllContact();
  }
}
