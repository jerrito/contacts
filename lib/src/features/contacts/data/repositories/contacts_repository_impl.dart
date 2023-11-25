import 'package:contacts/src/features/contacts/data/datasources/remoteds.dart';
import 'package:contacts/src/features/contacts/domain/entities/contact.dart';
import 'package:contacts/src/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

import '../../../../../core/network_info/network_info.dart';

class ContactsRepositoryImpl implements ContactsRepository {
  final NetworkInfo networkInfo;
  final ContactRemoteDatasource contactsRemoteDatasource;

  ContactsRepositoryImpl(
      {required this.contactsRemoteDatasource, required this.networkInfo});

  @override
  Future<Either<String, Contact>> createContact(
      Map<String, dynamic> params) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await contactsRemoteDatasource.createContact(params);

        return Right(response);
      } catch (e) {
        return Left(e.toString());
      }
    } else {
      return const Left("No network connection");
    }
  }

  @override
  Future<Either<String, Contact>> deleteContact(Map<String, dynamic> params) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future<Either<String, List<Contact>>> getAllContact(
     ) {
    // TODO: implement getAllContact
    throw UnimplementedError();
  }

  @override
  Future<Either<String, Contact>> updateContact(Map<String, dynamic> params) {
    // TODO: implement updateContact
    throw UnimplementedError();
  }
}
