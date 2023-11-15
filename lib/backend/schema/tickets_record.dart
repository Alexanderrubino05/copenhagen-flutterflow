import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class TicketsRecord extends FirestoreRecord {
  TicketsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "addressName" field.
  String? _addressName;
  String get addressName => _addressName ?? '';
  bool hasAddressName() => _addressName != null;

  // "address" field.
  LatLng? _address;
  LatLng? get address => _address;
  bool hasAddress() => _address != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "start" field.
  DateTime? _start;
  DateTime? get start => _start;
  bool hasStart() => _start != null;

  // "userId" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "homeTeam" field.
  int? _homeTeam;
  int get homeTeam => _homeTeam ?? 0;
  bool hasHomeTeam() => _homeTeam != null;

  // "awayTeam" field.
  int? _awayTeam;
  int get awayTeam => _awayTeam ?? 0;
  bool hasAwayTeam() => _awayTeam != null;

  void _initializeFields() {
    _addressName = snapshotData['addressName'] as String?;
    _address = snapshotData['address'] as LatLng?;
    _description = snapshotData['description'] as String?;
    _title = snapshotData['title'] as String?;
    _start = snapshotData['start'] as DateTime?;
    _userId = snapshotData['userId'] as DocumentReference?;
    _homeTeam = castToType<int>(snapshotData['homeTeam']);
    _awayTeam = castToType<int>(snapshotData['awayTeam']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('tickets');

  static Stream<TicketsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => TicketsRecord.fromSnapshot(s));

  static Future<TicketsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => TicketsRecord.fromSnapshot(s));

  static TicketsRecord fromSnapshot(DocumentSnapshot snapshot) =>
      TicketsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static TicketsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      TicketsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'TicketsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is TicketsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createTicketsRecordData({
  String? addressName,
  LatLng? address,
  String? description,
  String? title,
  DateTime? start,
  DocumentReference? userId,
  int? homeTeam,
  int? awayTeam,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'addressName': addressName,
      'address': address,
      'description': description,
      'title': title,
      'start': start,
      'userId': userId,
      'homeTeam': homeTeam,
      'awayTeam': awayTeam,
    }.withoutNulls,
  );

  return firestoreData;
}

class TicketsRecordDocumentEquality implements Equality<TicketsRecord> {
  const TicketsRecordDocumentEquality();

  @override
  bool equals(TicketsRecord? e1, TicketsRecord? e2) {
    return e1?.addressName == e2?.addressName &&
        e1?.address == e2?.address &&
        e1?.description == e2?.description &&
        e1?.title == e2?.title &&
        e1?.start == e2?.start &&
        e1?.userId == e2?.userId &&
        e1?.homeTeam == e2?.homeTeam &&
        e1?.awayTeam == e2?.awayTeam;
  }

  @override
  int hash(TicketsRecord? e) => const ListEquality().hash([
        e?.addressName,
        e?.address,
        e?.description,
        e?.title,
        e?.start,
        e?.userId,
        e?.homeTeam,
        e?.awayTeam
      ]);

  @override
  bool isValidKey(Object? o) => o is TicketsRecord;
}
