part of 'contacts_bloc.dart';

abstract class ContactsState extends Equatable {
  const ContactsState();

  @override
  List<Object> get props => [];
}

class ContactsInitial extends ContactsState {}

class CreateContactLoading extends ContactsState {}

class CreateContactLoaded extends ContactsState {
  final Contact contact;

  const CreateContactLoaded({required this.contact});
}

class GetAllContactsLoading extends ContactsState {}

class GetAllContactsLoaded extends ContactsState {
  final List<Contact> list;
  const GetAllContactsLoaded({required this.list});
}

class GenericError extends ContactsState {
  final String error;

  const GenericError({required this.error});
}
