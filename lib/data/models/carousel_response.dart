import 'package:capstone_kuliku/data/models/carousel_model.dart';
import 'package:capstone_kuliku/data/models/customer_model.dart';
import 'package:capstone_kuliku/domain/entities/customer.dart';
import 'package:equatable/equatable.dart';

class CarouselResponse extends Equatable {
  final List<CarouselModel> carouselList;

  CarouselResponse({required this.carouselList});

  factory CarouselResponse.fromJson(Map<String, dynamic> json) => CarouselResponse(
        carouselList: List<CarouselModel>.from((json["data"]as List)
            .map((x) => CarouselModel.fromJson(x))
            .where((element) => element.image != null)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(carouselList.map((x) => x.toJson)),
      };

  @override
  List<Object?> get props => [carouselList];
}
