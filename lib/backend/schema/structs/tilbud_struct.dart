// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TilbudStruct extends FFFirebaseStruct {
  TilbudStruct({
    String? beskrivelse,
    String? billede,
    String? sponsorName,
    DateTime? date,
    String? link,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _beskrivelse = beskrivelse,
        _billede = billede,
        _sponsorName = sponsorName,
        _date = date,
        _link = link,
        super(firestoreUtilData);

  // "beskrivelse" field.
  String? _beskrivelse;
  String get beskrivelse => _beskrivelse ?? '';
  set beskrivelse(String? val) => _beskrivelse = val;
  bool hasBeskrivelse() => _beskrivelse != null;

  // "billede" field.
  String? _billede;
  String get billede => _billede ?? '';
  set billede(String? val) => _billede = val;
  bool hasBillede() => _billede != null;

  // "sponsor_name" field.
  String? _sponsorName;
  String get sponsorName => _sponsorName ?? '';
  set sponsorName(String? val) => _sponsorName = val;
  bool hasSponsorName() => _sponsorName != null;

  // "date" field.
  DateTime? _date;
  DateTime? get date => _date;
  set date(DateTime? val) => _date = val;
  bool hasDate() => _date != null;

  // "link" field.
  String? _link;
  String get link => _link ?? '';
  set link(String? val) => _link = val;
  bool hasLink() => _link != null;

  static TilbudStruct fromMap(Map<String, dynamic> data) => TilbudStruct(
        beskrivelse: data['beskrivelse'] as String?,
        billede: data['billede'] as String?,
        sponsorName: data['sponsor_name'] as String?,
        date: data['date'] as DateTime?,
        link: data['link'] as String?,
      );

  static TilbudStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? TilbudStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'beskrivelse': _beskrivelse,
        'billede': _billede,
        'sponsor_name': _sponsorName,
        'date': _date,
        'link': _link,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'beskrivelse': serializeParam(
          _beskrivelse,
          ParamType.String,
        ),
        'billede': serializeParam(
          _billede,
          ParamType.String,
        ),
        'sponsor_name': serializeParam(
          _sponsorName,
          ParamType.String,
        ),
        'date': serializeParam(
          _date,
          ParamType.DateTime,
        ),
        'link': serializeParam(
          _link,
          ParamType.String,
        ),
      }.withoutNulls;

  static TilbudStruct fromSerializableMap(Map<String, dynamic> data) =>
      TilbudStruct(
        beskrivelse: deserializeParam(
          data['beskrivelse'],
          ParamType.String,
          false,
        ),
        billede: deserializeParam(
          data['billede'],
          ParamType.String,
          false,
        ),
        sponsorName: deserializeParam(
          data['sponsor_name'],
          ParamType.String,
          false,
        ),
        date: deserializeParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        link: deserializeParam(
          data['link'],
          ParamType.String,
          false,
        ),
      );

  static TilbudStruct fromAlgoliaData(Map<String, dynamic> data) =>
      TilbudStruct(
        beskrivelse: convertAlgoliaParam(
          data['beskrivelse'],
          ParamType.String,
          false,
        ),
        billede: convertAlgoliaParam(
          data['billede'],
          ParamType.String,
          false,
        ),
        sponsorName: convertAlgoliaParam(
          data['sponsor_name'],
          ParamType.String,
          false,
        ),
        date: convertAlgoliaParam(
          data['date'],
          ParamType.DateTime,
          false,
        ),
        link: convertAlgoliaParam(
          data['link'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'TilbudStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is TilbudStruct &&
        beskrivelse == other.beskrivelse &&
        billede == other.billede &&
        sponsorName == other.sponsorName &&
        date == other.date &&
        link == other.link;
  }

  @override
  int get hashCode => const ListEquality()
      .hash([beskrivelse, billede, sponsorName, date, link]);
}

TilbudStruct createTilbudStruct({
  String? beskrivelse,
  String? billede,
  String? sponsorName,
  DateTime? date,
  String? link,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    TilbudStruct(
      beskrivelse: beskrivelse,
      billede: billede,
      sponsorName: sponsorName,
      date: date,
      link: link,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

TilbudStruct? updateTilbudStruct(
  TilbudStruct? tilbud, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    tilbud
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addTilbudStructData(
  Map<String, dynamic> firestoreData,
  TilbudStruct? tilbud,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (tilbud == null) {
    return;
  }
  if (tilbud.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && tilbud.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final tilbudData = getTilbudFirestoreData(tilbud, forFieldValue);
  final nestedData = tilbudData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = tilbud.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getTilbudFirestoreData(
  TilbudStruct? tilbud, [
  bool forFieldValue = false,
]) {
  if (tilbud == null) {
    return {};
  }
  final firestoreData = mapToFirestore(tilbud.toMap());

  // Add any Firestore field values
  tilbud.firestoreUtilData.fieldValues.forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getTilbudListFirestoreData(
  List<TilbudStruct>? tilbuds,
) =>
    tilbuds?.map((e) => getTilbudFirestoreData(e, true)).toList() ?? [];
