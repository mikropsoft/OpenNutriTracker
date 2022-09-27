// ignore_for_file: non_constant_identifier_names
import 'package:json_annotation/json_annotation.dart';
import 'package:opennutritracker/features/addItem/data/dto/off_product.dart';

part 'off_word_response.g.dart';

@JsonSerializable()
class OFFWordResponse {
  final double? count;
  final int? page;
  final int? page_count;
  final int? page_size;

  final List<OFFProduct> products;

  OFFWordResponse(
      {required this.count,
      required this.page,
      required this.page_count,
      required this.page_size,
      required this.products});

  factory OFFWordResponse.fromJson(Map<String, dynamic> json) =>
      _$OFFWordResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OFFWordResponseToJson(this);
}