import 'dart:convert';

import 'package:capstone_kuliku/data/models/customer_model.dart';

import '../../common/exception.dart';
import '../models/customer_response.dart';
import 'package:http/io_client.dart';

abstract class CustomerRemoteDataSource {
  Future<List<CustomerModel>> getListCustomer();
}

class CustomerRemoteDataSourceImpl implements CustomerRemoteDataSource {
  static const BASE_URL = 'http://10.0.2.2:8000';

  final IOClient client;

  CustomerRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CustomerModel>> getListCustomer() async {
    final response = await client.get(Uri.parse('$BASE_URL/api/customers'));

    if (response.statusCode == 200) {
      return CustomerResponse.fromJson(json.decode(response.body)).customerList;
    } else {
      throw ServerException();
    }
  }
}
