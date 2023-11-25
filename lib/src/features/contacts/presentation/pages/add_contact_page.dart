import 'package:contacts/service_locator.dart';
import 'package:contacts/src/features/contacts/presentation/bloc/contacts_bloc.dart';
import 'package:contacts/src/features/contacts/presentation/pages/contact_page.dart';
import 'package:contacts/src/features/contacts/presentation/widgets/default_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContactPage extends StatefulWidget {
  const AddContactPage({super.key});

  @override
  State<AddContactPage> createState() => _AddContactPageState();
}

class _AddContactPageState extends State<AddContactPage> {
  final contactBloc = sl<ContactsBloc>();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final lastNameController = TextEditingController();
  final firstNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add contact"),
      ),
      bottomSheet: ElevatedButton(
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(300, 50),
          //backgroundColor: Colors.indigoAccent
        ),
        onPressed: () {
          
          final Map<String, dynamic> params = {
            "first_name": firstNameController.text,
            "email": emailController.text,
            "last_name": lastNameController.text,
            "phone_number": phoneNumberController.text,
            "id": 1
          };
          contactBloc.add(CreateContactEvent(params: params));
        },
        child: const Text("Save"),
      ),
      body: BlocConsumer<ContactsBloc, ContactsState>(
        bloc: contactBloc,
        listener: (context, state) {
          if (state is CreateContactLoaded) {
            ScaffoldMessenger.of(context)
                .showSnackBar(const SnackBar(content: Text("Success")));
            Navigator.push(context, PageRouteBuilder(pageBuilder: (_, __, ___) {
              return const ContactsPage();
            }));
          }

          if (state is GenericError) {
            ScaffoldMessenger.of(context)
                .showSnackBar(SnackBar(content: Text(state.error)));
            debugPrint(state.error);
          }
        },
        builder: (context, state) {
          if (state is CreateContactLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("FirstName"),
                  DefaultTextField(
                    controller: firstNameController,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("LastName"),
                  DefaultTextField(
                    controller: lastNameController,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Phone Number"),
                  DefaultTextField(
                    controller: phoneNumberController,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Email"),
                  DefaultTextField(
                    controller: emailController,
                    obscureText: false,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ])),
          );
        },
      ),
    );
  }
}
