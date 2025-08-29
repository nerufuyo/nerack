/// Genre data model for API serialization
/// 
/// This model handles the conversion between JSON data from the API
/// and the Genre domain entity.
class GenreModel {
  final String id;
  final String name;
  final String? description;
  final String category;
  final String? color;
  final int bookCount;
  final DateTime createdAt;
  final DateTime updatedAt;

  const GenreModel({
    required this.id,
    required this.name,
    this.description,
    required this.category,
    this.color,
    required this.bookCount,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create GenreModel from JSON
  factory GenreModel.fromJson(Map<String, dynamic> json) {
    return GenreModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String?,
      category: json['category'] as String,
      color: json['color'] as String?,
      bookCount: (json['bookCount'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// Convert GenreModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (description != null) 'description': description,
      'category': category,
      if (color != null) 'color': color,
      'bookCount': bookCount,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Copy with method for creating modified instances
  GenreModel copyWith({
    String? id,
    String? name,
    String? description,
    String? category,
    String? color,
    int? bookCount,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return GenreModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      category: category ?? this.category,
      color: color ?? this.color,
      bookCount: bookCount ?? this.bookCount,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is GenreModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'GenreModel{id: $id, name: $name, category: $category, bookCount: $bookCount}';
  }
}
