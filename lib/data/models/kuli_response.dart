import 'package:capstone_kuliku/data/models/kuli_model.dart';
import 'package:equatable/equatable.dart';

class KuliResponse extends Equatable {
  final List<KuliModel> kuliList;

  KuliResponse({required this.kuliList});

  factory KuliResponse.fromJson(Map<String, dynamic> json) => KuliResponse(
        kuliList: List<KuliModel>.from((json['result'] as List)
            .map((x) => KuliModel.fromJson(x))
            .where((element) => element.username != null)),
      );

  Map<String, dynamic> toJson() => {
        'result': List<dynamic>.from(kuliList.map((x) => x.toJson)),
      };

  @override
  List<Object?> get props => [kuliList];
}
