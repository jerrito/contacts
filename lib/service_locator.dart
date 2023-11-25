import 'package:contacts/core/network_info/network_info.dart';
import 'package:contacts/core/urls/urls.dart';
import 'package:contacts/src/features/contacts/data/datasources/remoteds.dart';
import 'package:contacts/src/features/contacts/data/repositories/contacts_repository_impl.dart';
import 'package:contacts/src/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:contacts/src/features/contacts/domain/usecases/create_contact.dart';
import 'package:contacts/src/features/contacts/domain/usecases/get_all_contacts.dart';
import 'package:contacts/src/features/contacts/presentation/bloc/contacts_bloc.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final sl = GetIt.instance;

void initDependencies() {
  //bloc
  sl.registerFactory(
    () => ContactsBloc(
      createContact: sl(),
      getAllContacts: sl()
    ),
  );

  //usecases

  sl.registerLazySingleton(
    () => CreateContact(
      repository: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => GetAllContacts(
      repository: sl(),
    ),
  );

  //repository

  sl.registerLazySingleton<ContactsRepository>(
    () => ContactsRepositoryImpl(
      contactsRemoteDatasource: sl(),
      networkInfo: sl(),
    ),
  );
  //datasources

  sl.registerLazySingleton<ContactRemoteDatasource>(
    () => ContactRemoteDatasourceImpl(
      client: sl(),
      url: sl(),
    ),
  );

  sl.registerLazySingleton<NetworkInfo>(
    () => NetworkInfoImpl(
      dataConnectionChecker: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => http.Client(),
  );

  sl.registerLazySingleton(() => URL());

  sl.registerLazySingleton(() => DataConnectionChecker());
}
