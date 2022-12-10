import 'package:capstone_kuliku/data/models/customer_model.dart';
import 'package:capstone_kuliku/domain/entities/customer.dart';
import 'package:equatable/equatable.dart';

class CustomerResponse extends Equatable {
  final List<CustomerModel> customerList;

  CustomerResponse({required this.customerList});

  factory CustomerResponse.fromJson(Map<String, dynamic> json) => CustomerResponse(
        customerList: List<CustomerModel>.from((json["data"]as List)
            .map((x) => CustomerModel.fromJson(x))
            .where((element) => element.username != null)),
      );

  Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(customerList.map((x) => x.toJson)),
      };

  @override
  List<Object?> get props => [customerList];
}
