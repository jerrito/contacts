// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:contacts/core/urls/urls.dart';
import 'package:contacts/core/usecases/usecases.dart';
import 'package:http/http.dart' as http;

import 'package:contacts/src/features/contacts/data/models/contact_model.dart';

abstract class ContactRemoteDatasource {
  Future<ContactModel> createContact(Map<String, dynamic> param);
  Future<ContactModel> deleteContact(Map<String, dynamic> param);
  Future<ContactModel> updateContact(Map<String, dynamic> param);
  Future<List<ContactModel>> getAllContact(NoParams param);
}

class ContactRemoteDatasourceImpl implements ContactRemoteDatasource {
  http.Client client;
  URL url;
  ContactRemoteDatasourceImpl({required this.client, required this.url});
  @override
  Future<ContactModel> createContact(Map<String, dynamic> param) async {
    print(jsonEncode(param));
    final response = await client.post(
      url.returnURI("/create-contact"),
      body: (jsonEncode(param)),
      // headers: <String, String>{
      //   "Content-Type": "application/json; charset=UTF-8"
      // }
    );

    final decodedResponse = json.decode(response.body);

    if (response.statusCode == 201) {
      return ContactModel.fromJson(decodedResponse);
    } else {
      throw Exception(decodedResponse);
    }
  }

  @override
  Future<ContactModel> deleteContact(Map<String, dynamic> param) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future<List<ContactModel>> getAllContact(NoParams param) async {
    final response = await client.get(url.returnURI("/all-contacts"));

     final decodeResponse=jsonDecode(response.body);
    if(response.statusCode==200){
      return userModelfromJson(response.body);
      
    }
    else{
      throw Exception(decodeResponse);
    }
  }

  @override
  Future<ContactModel> updateContact(Map<String, dynamic> param) {
    // TODO: implement updateContact
    throw UnimplementedError();
  }
}
