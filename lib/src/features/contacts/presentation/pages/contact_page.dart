import 'package:contacts/core/usecases/usecases.dart';
import 'package:contacts/service_locator.dart';
import 'package:contacts/src/features/contacts/presentation/bloc/contacts_bloc.dart';
import 'package:contacts/src/features/contacts/presentation/pages/add_contact_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsPage extends StatefulWidget {
  const ContactsPage({super.key});

  @override
  State<ContactsPage> createState() => _ContactsPageState();
}

class _ContactsPageState extends State<ContactsPage> {
  final contactBloc = sl<ContactsBloc>();
  final NoParams params = NoParams();

  @override
  Widget build(BuildContext context) {
    contactBloc.add(GetAllContactEvent(params));
    return Scaffold(
        appBar: AppBar(title: const Text("Contacts Page")),
        floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (_, __, ___) {
                return const AddContactPage();
              }));
            },
            child: const Icon(Icons.add)),
        body: BlocBuilder<ContactsBloc, ContactsState>(
            bloc: sl<ContactsBloc>(),
            builder: (context, state) {
              if (state is GetAllContactsLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is GetAllContactsLoaded) {
                return SingleChildScrollView(
                    child: ListView.builder(
                  itemCount: state.list.length,
                  itemBuilder: (context, index) {
                    final data = state.list[index];

                    return  ListTile(
                      title: Text(data.firstName!),
                    );
                  },
                ));
              }

              return const Center(child: Text("Add contact"));
            }));
  }
}
