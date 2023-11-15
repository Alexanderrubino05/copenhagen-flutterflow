// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TeamsStruct extends FFFirebaseStruct {
  TeamsStruct({
    String? name,
    String? teamId,
    String? image,
    String? slugName,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _name = name,
        _teamId = teamId,
        _image = image,
        _slugName = slugName,
        super(firestoreUtilData);

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  set name(String? val) => _name = val;
  bool hasName() => _name != null;

  // "team_id" field.
  String? _teamId;
  String get teamId => _teamId ?? '';
  set teamId(String? val) => _teamId = val;
  bool hasTeamId() => _teamId != null;

  // "image" field.
  String? _image;
  String get image => _image ?? '';
  set image(String? val) => _image = val;
  bool hasImage() => _image != null;

  // "slug_name" field.
  String? _slugName;
  String get slugName => _slugName ?? '';
  set slugName(String? val) => _slugName = val;
  bool hasSlugName() => _slugName != null;

  static TeamsStruct fromMap(Map<String, dynamic> data) => TeamsStruct(
        name: data['name'] as String?,
        teamId: data['team_id'] as String?,
        image: data['image'] as String?,
        slugName: data['slug_name'] as String?,
      );

  static TeamsStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TeamsStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'name': _name,
        'team_id': _teamId,
        'image': _image,
        'slug_name': _slugName,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'name': serializeParam(
          _name,
          ParamType.String,
        ),
        'team_id': serializeParam(
          _teamId,
          ParamType.String,
        ),
        'image': serializeParam(
          _image,
          ParamType.String,
        ),
        'slug_name': serializeParam(
          _slugName,
          ParamType.String,
        ),
      }.withoutNulls;

  static TeamsStruct fromSerializableMap(Map<String, dynamic> data) =>
      TeamsStruct(
        name: deserializeParam(
          data['name'],
          ParamType.String,
          false,
        ),
        teamId: deserializeParam(
          data['team_id'],
          ParamType.String,
          false,
        ),
        image: deserializeParam(
          data['image'],
          ParamType.String,
          false,
        ),
        slugName: deserializeParam(
          data['slug_name'],
          ParamType.String,
          false,
        ),
      );

  static TeamsStruct fromAlgoliaData(Map<String, dynamic> data) => TeamsStruct(
        name: convertAlgoliaParam(
          data['name'],
          ParamType.String,
          false,
        ),
        teamId: convertAlgoliaParam(
          data['team_id'],
          ParamType.String,
          false,
        ),
        image: convertAlgoliaParam(
          data['image'],
          ParamType.String,
          false,
        ),
        slugName: convertAlgoliaParam(
          data['slug_name'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TeamsStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TeamsStruct &&
        name == other.name &&
        teamId == other.teamId &&
        image == other.image &&
        slugName == other.slugName;
  }

  @override
  int get hashCode =>
      const ListEquality().hash([name, teamId, image, slugName]);
}

TeamsStruct createTeamsStruct({
  String? name,
  String? teamId,
  String? image,
  String? slugName,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TeamsStruct(
      name: name,
      teamId: teamId,
      image: image,
      slugName: slugName,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TeamsStruct? updateTeamsStruct(
  TeamsStruct? teams, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    teams
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTeamsStructData(
  Map<String, dynamic> firestoreData,
  TeamsStruct? teams,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (teams == null) {
    return;
  }
  if (teams.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && teams.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final teamsData = getTeamsFirestoreData(teams, forFieldValue);
  final nestedData = teamsData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = teams.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTeamsFirestoreData(
  TeamsStruct? teams, [
  bool forFieldValue = false,
]) {
  if (teams == null) {
    return {};
  }
  final firestoreData = mapToFirestore(teams.toMap());

  // Add any Firestore field values
  teams.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTeamsListFirestoreData(
  List<TeamsStruct>? teamss,
) =>
    teamss?.map((e) => getTeamsFirestoreData(e, true)).toList() ?? [];
