import 'package:contacts/core/usecases/usecases.dart';
import 'package:contacts/src/features/contacts/domain/entities/contact.dart';
import 'package:contacts/src/features/contacts/domain/usecases/create_contact.dart';
import 'package:contacts/src/features/contacts/domain/usecases/get_all_contacts.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'contacts_event.dart';
part 'contacts_state.dart';

class ContactsBloc extends Bloc<ContactsEvent, ContactsState> {
  final CreateContact createContact;
  final GetAllContacts getAllContacts;
  ContactsBloc({required this.getAllContacts, required this.createContact})
      : super(ContactsInitial()) {
    on<CreateContactEvent>((event, emit) async {
      
      emit(CreateContactLoading());

      final response = await createContact.call(event.params);

      emit(response.fold((error) => GenericError(error: error),
          (response) => CreateContactLoaded(contact: response)));
    });

    on<GetAllContactEvent>((event, emit) async {
      emit(GetAllContactsLoading());

      final response = await getAllContacts.call(event.params);

      emit(response.fold((error) => GenericError(error: error),
          (response) => GetAllContactsLoaded(list: response)));
    });
  }
}
