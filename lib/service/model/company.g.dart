// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      symbol: json['Symbol'] as String,
      name: json['Name'] as String,
      address: json['Address'] as String,
      capitalization: json['MarketCapitalization'] as String,
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'Symbol': instance.symbol,
      'Name': instance.name,
      'Address': instance.address,
      'MarketCapitalization': instance.capitalization,
    };
