import 'package:capstone_kuliku/domain/entities/carousel.dart';
import 'package:capstone_kuliku/domain/entities/kuli.dart';
import 'package:equatable/equatable.dart';

class CarouselModel extends Equatable{
    const CarouselModel({
        required this.id,
        required this.image,
    });

    final int id;
    final String image;

    factory CarouselModel.fromJson(Map<String, dynamic> json) => CarouselModel(
        id: json["id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
    };

    Carousel toEntity() {
      return Carousel(
        id: id,
        image: image,
        );
    }
    
      @override
      List<Object?> get props => [
        id,
        image,
      ];
}
