// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class SponsorStruct extends FFFirebaseStruct {
  SponsorStruct({
    String? name,
    String? image,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _image = image,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  static SponsorStruct fromMap(Map<String, dynamic> data) => SponsorStruct(
        name: data['name'] as String?,
        image: data['image'] as String?,
      );

  static SponsorStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? SponsorStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'image': _image,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
      }.withoutNulls;

  static SponsorStruct fromSerializableMap(Map<String, dynamic> data) =>
      SponsorStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
      );

  static SponsorStruct fromAlgoliaData(Map<String, dynamic> data) =>
      SponsorStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        image: convertAlgoliaParam(
          data['image'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'SponsorStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is SponsorStruct && name == other.name && image == other.image;
  }

  @override
  int get hashCode => const ListEquality().hash([name, image]);
}

SponsorStruct createSponsorStruct({
  String? name,
  String? image,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    SponsorStruct(
      name: name,
      image: image,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

SponsorStruct? updateSponsorStruct(
  SponsorStruct? sponsor, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    sponsor
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addSponsorStructData(
  Map<String, dynamic> firestoreData,
  SponsorStruct? sponsor,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (sponsor == null) {
    return;
  }
  if (sponsor.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && sponsor.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final sponsorData = getSponsorFirestoreData(sponsor, forFieldValue);
  final nestedData = sponsorData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = sponsor.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getSponsorFirestoreData(
  SponsorStruct? sponsor, [
  bool forFieldValue = false,
]) {
  if (sponsor == null) {
    return {};
  }
  final firestoreData = mapToFirestore(sponsor.toMap());

  // Add any Firestore field values
  sponsor.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getSponsorListFirestoreData(
  List<SponsorStruct>? sponsors,
) =>
    sponsors?.map((e) => getSponsorFirestoreData(e, true)).toList() ?? [];
