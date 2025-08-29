/// Author data model for API serialization
/// 
/// This model handles the conversion between JSON data from the API
/// and the Author domain entity.
class AuthorModel {
  final String id;
  final String name;
  final String? bio;
  final DateTime? birthDate;
  final DateTime? deathDate;
  final String? nationality;
  final String? image;
  final String? googleBooksId;
  final String? openLibraryId;
  final String? goodreadsId;
  final DateTime createdAt;
  final DateTime updatedAt;

  const AuthorModel({
    required this.id,
    required this.name,
    this.bio,
    this.birthDate,
    this.deathDate,
    this.nationality,
    this.image,
    this.googleBooksId,
    this.openLibraryId,
    this.goodreadsId,
    required this.createdAt,
    required this.updatedAt,
  });

  /// Create AuthorModel from JSON
  factory AuthorModel.fromJson(Map<String, dynamic> json) {
    return AuthorModel(
      id: json['id'] as String,
      name: json['name'] as String,
      bio: json['bio'] as String?,
      birthDate: json['birthDate'] != null 
          ? DateTime.parse(json['birthDate'] as String)
          : null,
      deathDate: json['deathDate'] != null 
          ? DateTime.parse(json['deathDate'] as String)
          : null,
      nationality: json['nationality'] as String?,
      image: json['image'] as String?,
      googleBooksId: json['googleBooksId'] as String?,
      openLibraryId: json['openLibraryId'] as String?,
      goodreadsId: json['goodreadsId'] as String?,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
    );
  }

  /// Convert AuthorModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      if (bio != null) 'bio': bio,
      if (birthDate != null) 'birthDate': birthDate!.toIso8601String(),
      if (deathDate != null) 'deathDate': deathDate!.toIso8601String(),
      if (nationality != null) 'nationality': nationality,
      if (image != null) 'image': image,
      if (googleBooksId != null) 'googleBooksId': googleBooksId,
      if (openLibraryId != null) 'openLibraryId': openLibraryId,
      if (goodreadsId != null) 'goodreadsId': goodreadsId,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }

  /// Copy with method for creating modified instances
  AuthorModel copyWith({
    String? id,
    String? name,
    String? bio,
    DateTime? birthDate,
    DateTime? deathDate,
    String? nationality,
    String? image,
    String? googleBooksId,
    String? openLibraryId,
    String? goodreadsId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return AuthorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      bio: bio ?? this.bio,
      birthDate: birthDate ?? this.birthDate,
      deathDate: deathDate ?? this.deathDate,
      nationality: nationality ?? this.nationality,
      image: image ?? this.image,
      googleBooksId: googleBooksId ?? this.googleBooksId,
      openLibraryId: openLibraryId ?? this.openLibraryId,
      goodreadsId: goodreadsId ?? this.goodreadsId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    
    return other is AuthorModel && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'AuthorModel{id: $id, name: $name, nationality: $nationality}';
  }
}
