import 'dart:convert';

import 'package:capstone_kuliku/data/models/carousel_model.dart';
import 'package:capstone_kuliku/data/models/carousel_response.dart';
import 'package:capstone_kuliku/data/models/customer_model.dart';

import '../../common/exception.dart';
import '../models/customer_response.dart';
import 'package:http/io_client.dart';


abstract class CarouselRemoteDataSource {
  Future<List<CarouselModel>> getListCarousel();
}

class CarouselRemoteDataSourceImpl implements CarouselRemoteDataSource {
  static const BASE_URL = 'http://10.0.2.2:8000';

  final IOClient client;

  CarouselRemoteDataSourceImpl({required this.client});

  @override
  Future<List<CarouselModel>> getListCarousel() async {
    final response = 
    await client.get(Uri.parse('$BASE_URL/api/carousel'));

    if (response.statusCode == 200) {
      return CarouselResponse.fromJson(json.decode(response.body)).carouselList;
    } else {
      throw ServerException();
    }
  }
}
