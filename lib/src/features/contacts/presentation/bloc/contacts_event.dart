part of 'contacts_bloc.dart';

abstract class ContactsEvent extends Equatable {
  const ContactsEvent();

  @override
  List<Object> get props => [];
}

class CreateContactEvent extends ContactsEvent{
  final Map<String,dynamic> params;

 const CreateContactEvent({required this.params});
  
}

class GetAllContactEvent extends ContactsEvent{
final NoParams params;

 const GetAllContactEvent(this.params);
  
}
