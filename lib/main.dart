import 'package:contacts/src/features/contacts/presentation/bloc/contacts_bloc.dart';
import 'package:contacts/src/features/contacts/presentation/pages/contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import './service_locator.dart';

void main() {
  initDependencies();
  runApp(
     BlocProvider(

      create: (context) => sl<ContactsBloc>(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true
        ),
        home: const ContactsPage(),
      ),
    ),
  );
}
