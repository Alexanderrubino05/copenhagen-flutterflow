// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GiftStruct extends FFFirebaseStruct {
  GiftStruct({
    String? giftUri,
    String? giftTitle,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _giftUri = giftUri,
        _giftTitle = giftTitle,
        super(firestoreUtilData);

  // "gift_uri" field.
  String? _giftUri;
  String get giftUri => _giftUri ?? '';
  set giftUri(String? val) => _giftUri = val;
  bool hasGiftUri() => _giftUri != null;

  // "gift_title" field.
  String? _giftTitle;
  String get giftTitle => _giftTitle ?? '';
  set giftTitle(String? val) => _giftTitle = val;
  bool hasGiftTitle() => _giftTitle != null;

  static GiftStruct fromMap(Map<String, dynamic> data) => GiftStruct(
        giftUri: data['gift_uri'] as String?,
        giftTitle: data['gift_title'] as String?,
      );

  static GiftStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GiftStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'gift_uri': _giftUri,
        'gift_title': _giftTitle,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'gift_uri': serializeParam(
          _giftUri,
          ParamType.String,
        ),
        'gift_title': serializeParam(
          _giftTitle,
          ParamType.String,
        ),
      }.withoutNulls;

  static GiftStruct fromSerializableMap(Map<String, dynamic> data) =>
      GiftStruct(
        giftUri: deserializeParam(
          data['gift_uri'],
          ParamType.String,
          false,
        ),
        giftTitle: deserializeParam(
          data['gift_title'],
          ParamType.String,
          false,
        ),
      );

  static GiftStruct fromAlgoliaData(Map<String, dynamic> data) => GiftStruct(
        giftUri: convertAlgoliaParam(
          data['gift_uri'],
          ParamType.String,
          false,
        ),
        giftTitle: convertAlgoliaParam(
          data['gift_title'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'GiftStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GiftStruct &&
        giftUri == other.giftUri &&
        giftTitle == other.giftTitle;
  }

  @override
  int get hashCode => const ListEquality().hash([giftUri, giftTitle]);
}

GiftStruct createGiftStruct({
  String? giftUri,
  String? giftTitle,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GiftStruct(
      giftUri: giftUri,
      giftTitle: giftTitle,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GiftStruct? updateGiftStruct(
  GiftStruct? gift, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gift
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGiftStructData(
  Map<String, dynamic> firestoreData,
  GiftStruct? gift,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gift == null) {
    return;
  }
  if (gift.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields = !forFieldValue && gift.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final giftData = getGiftFirestoreData(gift, forFieldValue);
  final nestedData = giftData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gift.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGiftFirestoreData(
  GiftStruct? gift, [
  bool forFieldValue = false,
]) {
  if (gift == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gift.toMap());

  // Add any Firestore field values
  gift.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGiftListFirestoreData(
  List<GiftStruct>? gifts,
) =>
    gifts?.map((e) => getGiftFirestoreData(e, true)).toList() ?? [];
