import 'dart:convert';

import '../../common/exception.dart';
import '../models/kuli_model.dart';
import 'package:http/io_client.dart';

import '../models/kuli_response.dart';

abstract class KuliRemoteDataSource {
  Future<List<KuliModel>> getListKuli();
}

class KuliRemoteDataSourceImpl implements KuliRemoteDataSource {
  static const BASE_URL = 'http://10.0.2.2:8000';

  final IOClient client;

  KuliRemoteDataSourceImpl({required this.client});

  @override
  Future<List<KuliModel>> getListKuli() async {
    final response = await client.get(Uri.parse('$BASE_URL/api/kuli'));

    if (response.statusCode == 200) {
      return KuliResponse.fromJson(json.decode(response.body)).kuliList;
    } else {
      throw ServerException();
    }
  }
}
