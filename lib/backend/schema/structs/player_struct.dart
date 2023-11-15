// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class PlayerStruct extends FFFirebaseStruct {
  PlayerStruct({
    String? name,
    String? number,
    List<String>? images,
    String? height,
    String? year,
    String? homeCountry,
    String? position,
    String? bio,
    bool? isLiked,
    String? shortPosition,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _number = number,
        _images = images,
        _height = height,
        _year = year,
        _homeCountry = homeCountry,
        _position = position,
        _bio = bio,
        _isLiked = isLiked,
        _shortPosition = shortPosition,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "number" field.
  String? _number;
  String get number => _number ?? '';
  set number(String? val) => _number = val;
  bool hasNumber() => _number != null;

  // "images" field.
  List<String>? _images;
  List<String> get images => _images ?? const [];
  set images(List<String>? val) => _images = val;
  void updateImages(Function(List<String>) updateFn) =>
      updateFn(_images ??= []);
  bool hasImages() => _images != null;

  // "height" field.
  String? _height;
  String get height => _height ?? '';
  set height(String? val) => _height = val;
  bool hasHeight() => _height != null;

  // "year" field.
  String? _year;
  String get year => _year ?? '';
  set year(String? val) => _year = val;
  bool hasYear() => _year != null;

  // "home_country" field.
  String? _homeCountry;
  String get homeCountry => _homeCountry ?? '';
  set homeCountry(String? val) => _homeCountry = val;
  bool hasHomeCountry() => _homeCountry != null;

  // "position" field.
  String? _position;
  String get position => _position ?? '';
  set position(String? val) => _position = val;
  bool hasPosition() => _position != null;

  // "bio" field.
  String? _bio;
  String get bio => _bio ?? '';
  set bio(String? val) => _bio = val;
  bool hasBio() => _bio != null;

  // "is_liked" field.
  bool? _isLiked;
  bool get isLiked => _isLiked ?? false;
  set isLiked(bool? val) => _isLiked = val;
  bool hasIsLiked() => _isLiked != null;

  // "short_position" field.
  String? _shortPosition;
  String get shortPosition => _shortPosition ?? '';
  set shortPosition(String? val) => _shortPosition = val;
  bool hasShortPosition() => _shortPosition != null;

  static PlayerStruct fromMap(Map<String, dynamic> data) => PlayerStruct(
        name: data['name'] as String?,
        number: data['number'] as String?,
        images: getDataList(data['images']),
        height: data['height'] as String?,
        year: data['year'] as String?,
        homeCountry: data['home_country'] as String?,
        position: data['position'] as String?,
        bio: data['bio'] as String?,
        isLiked: data['is_liked'] as bool?,
        shortPosition: data['short_position'] as String?,
      );

  static PlayerStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? PlayerStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'number': _number,
        'images': _images,
        'height': _height,
        'year': _year,
        'home_country': _homeCountry,
        'position': _position,
        'bio': _bio,
        'is_liked': _isLiked,
        'short_position': _shortPosition,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'number': serializeParam(
          _number,
          ParamType.String,
        ),
        'images': serializeParam(
          _images,
          ParamType.String,
          true,
        ),
        'height': serializeParam(
          _height,
          ParamType.String,
        ),
        'year': serializeParam(
          _year,
          ParamType.String,
        ),
        'home_country': serializeParam(
          _homeCountry,
          ParamType.String,
        ),
        'position': serializeParam(
          _position,
          ParamType.String,
        ),
        'bio': serializeParam(
          _bio,
          ParamType.String,
        ),
        'is_liked': serializeParam(
          _isLiked,
          ParamType.bool,
        ),
        'short_position': serializeParam(
          _shortPosition,
          ParamType.String,
        ),
      }.withoutNulls;

  static PlayerStruct fromSerializableMap(Map<String, dynamic> data) =>
      PlayerStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: deserializeParam(
          data['number'],
          ParamType.String,
          false,
        ),
        images: deserializeParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        height: deserializeParam(
          data['height'],
          ParamType.String,
          false,
        ),
        year: deserializeParam(
          data['year'],
          ParamType.String,
          false,
        ),
        homeCountry: deserializeParam(
          data['home_country'],
          ParamType.String,
          false,
        ),
        position: deserializeParam(
          data['position'],
          ParamType.String,
          false,
        ),
        bio: deserializeParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        isLiked: deserializeParam(
          data['is_liked'],
          ParamType.bool,
          false,
        ),
        shortPosition: deserializeParam(
          data['short_position'],
          ParamType.String,
          false,
        ),
      );

  static PlayerStruct fromAlgoliaData(Map<String, dynamic> data) =>
      PlayerStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        number: convertAlgoliaParam(
          data['number'],
          ParamType.String,
          false,
        ),
        images: convertAlgoliaParam<String>(
          data['images'],
          ParamType.String,
          true,
        ),
        height: convertAlgoliaParam(
          data['height'],
          ParamType.String,
          false,
        ),
        year: convertAlgoliaParam(
          data['year'],
          ParamType.String,
          false,
        ),
        homeCountry: convertAlgoliaParam(
          data['home_country'],
          ParamType.String,
          false,
        ),
        position: convertAlgoliaParam(
          data['position'],
          ParamType.String,
          false,
        ),
        bio: convertAlgoliaParam(
          data['bio'],
          ParamType.String,
          false,
        ),
        isLiked: convertAlgoliaParam(
          data['is_liked'],
          ParamType.bool,
          false,
        ),
        shortPosition: convertAlgoliaParam(
          data['short_position'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'PlayerStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    const listEquality = ListEquality();
    return other is PlayerStruct &&
        name == other.name &&
        number == other.number &&
        listEquality.equals(images, other.images) &&
        height == other.height &&
        year == other.year &&
        homeCountry == other.homeCountry &&
        position == other.position &&
        bio == other.bio &&
        isLiked == other.isLiked &&
        shortPosition == other.shortPosition;
  }

  @override
  int get hashCode => const ListEquality().hash([
        name,
        number,
        images,
        height,
        year,
        homeCountry,
        position,
        bio,
        isLiked,
        shortPosition
      ]);
}

PlayerStruct createPlayerStruct({
  String? name,
  String? number,
  String? height,
  String? year,
  String? homeCountry,
  String? position,
  String? bio,
  bool? isLiked,
  String? shortPosition,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    PlayerStruct(
      name: name,
      number: number,
      height: height,
      year: year,
      homeCountry: homeCountry,
      position: position,
      bio: bio,
      isLiked: isLiked,
      shortPosition: shortPosition,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

PlayerStruct? updatePlayerStruct(
  PlayerStruct? player, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    player
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addPlayerStructData(
  Map<String, dynamic> firestoreData,
  PlayerStruct? player,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (player == null) {
    return;
  }
  if (player.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && player.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final playerData = getPlayerFirestoreData(player, forFieldValue);
  final nestedData = playerData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = player.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getPlayerFirestoreData(
  PlayerStruct? player, [
  bool forFieldValue = false,
]) {
  if (player == null) {
    return {};
  }
  final firestoreData = mapToFirestore(player.toMap());

  // Add any Firestore field values
  player.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getPlayerListFirestoreData(
  List<PlayerStruct>? players,
) =>
    players?.map((e) => getPlayerFirestoreData(e, true)).toList() ?? [];
