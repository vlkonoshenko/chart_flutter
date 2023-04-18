import 'package:json_annotation/json_annotation.dart';

part 'company.g.dart';

@JsonSerializable()
class Company {
  @JsonKey(name: 'Symbol')
  final String symbol;
  @JsonKey(name: 'Name')
  final String name;
  @JsonKey(name: 'Address')
  final String address;
  @JsonKey(name: 'MarketCapitalization')
  final String capitalization;

  const Company({
    required this.symbol,
    required this.name,
    required this.address,
    required this.capitalization,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
}
