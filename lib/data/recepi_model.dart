import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'links.dart';
import 'hit.dart';

class Recepimodel {
  final int from;
  final int to;
  final int count;
  final Links links;
  final List<Hit> hits;
  Recepimodel({
    required this.from,
    required this.to,
    required this.count,
    required this.links,
    required this.hits,
  });

  Recepimodel copyWith({
    int? from,
    int? to,
    int? count,
    Links? links,
    List<Hit>? hits,
  }) {
    return Recepimodel(
      from: from ?? this.from,
      to: to ?? this.to,
      count: count ?? this.count,
      links: links ?? this.links,
      hits: hits ?? this.hits,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'from': from,
      'to': to,
      'count': count,
      'links': links.toMap(),
      'hits': hits.map((x) => x.toMap()).toList(),
    };
  }

  factory Recepimodel.fromMap(Map<String, dynamic> map) {
    return Recepimodel(
      from: map['from']?.toInt(),
      to: map['to']?.toInt(),
      count: map['count']?.toInt(),
      links: Links.fromMap(map['links']),
      hits: List<Hit>.from(map['hits']?.map((x) => Hit.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory Recepimodel.fromJson(String source) => Recepimodel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Recepimodel(from: $from, to: $to, count: $count, _links: $links, hits: $hits)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Recepimodel &&
      other.from == from &&
      other.to == to &&
      other.count == count &&
      other.links == links &&
      listEquals(other.hits, hits);
  }

  @override
  int get hashCode {
    return from.hashCode ^
      to.hashCode ^
      count.hashCode ^
      links.hashCode ^
      hits.hashCode;
  }
}