import 'package:equatable/equatable.dart';

class Contact extends Equatable {
  final String? firstName, lastName, phoneNumber,email;
  final num?  id;

  const Contact(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.phoneNumber});

  @override
  List<Object?> get props => [firstName, lastName, email, phoneNumber, id];
}
