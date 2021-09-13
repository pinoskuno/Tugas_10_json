import 'dart:convert';

import 'links.dart';
import 'recipe.dart';

class Hit {
  final Recipe recipe;
  final Links links;
  Hit({
    required this.recipe,
    required this.links,
  });

  Hit copyWith({
    Recipe? recipe,
    Links? links,
  }) {
    return Hit(
      recipe: recipe ?? this.recipe,
      links: links ?? this.links,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'recipe': recipe.toMap(),
      'links': links.toMap(),
    };
  }

  factory Hit.fromMap(Map<String, dynamic> map) {
    return Hit(
      recipe: Recipe.fromMap(map['recipe']),
      links: Links.fromMap(map['links']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Hit.fromJson(String source) => Hit.fromMap(json.decode(source));

  @override
  String toString() => 'Hit(recipe: $recipe, links: $links)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Hit &&
      other.recipe == recipe &&
      other.links == links;
  }

  @override
  int get hashCode => recipe.hashCode ^ links.hashCode;
}