import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class FanklubRecord extends FirestoreRecord {
  FanklubRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "user_id" field.
  DocumentReference? _userId;
  DocumentReference? get userId => _userId;
  bool hasUserId() => _userId != null;

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "when_joined_fanklub" field.
  DateTime? _whenJoinedFanklub;
  DateTime? get whenJoinedFanklub => _whenJoinedFanklub;
  bool hasWhenJoinedFanklub() => _whenJoinedFanklub != null;

  // "tshirt" field.
  String? _tshirt;
  String get tshirt => _tshirt ?? '';
  bool hasTshirt() => _tshirt != null;

  void _initializeFields() {
    _userId = snapshotData['user_id'] as DocumentReference?;
    _name = snapshotData['name'] as String?;
    _email = snapshotData['email'] as String?;
    _whenJoinedFanklub = snapshotData['when_joined_fanklub'] as DateTime?;
    _tshirt = snapshotData['tshirt'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('fanklub');

  static Stream<FanklubRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => FanklubRecord.fromSnapshot(s));

  static Future<FanklubRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => FanklubRecord.fromSnapshot(s));

  static FanklubRecord fromSnapshot(DocumentSnapshot snapshot) =>
      FanklubRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static FanklubRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      FanklubRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'FanklubRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is FanklubRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createFanklubRecordData({
  DocumentReference? userId,
  String? name,
  String? email,
  DateTime? whenJoinedFanklub,
  String? tshirt,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'user_id': userId,
      'name': name,
      'email': email,
      'when_joined_fanklub': whenJoinedFanklub,
      'tshirt': tshirt,
    }.withoutNulls,
  );

  return firestoreData;
}

class FanklubRecordDocumentEquality implements Equality<FanklubRecord> {
  const FanklubRecordDocumentEquality();

  @override
  bool equals(FanklubRecord? e1, FanklubRecord? e2) {
    return e1?.userId == e2?.userId &&
        e1?.name == e2?.name &&
        e1?.email == e2?.email &&
        e1?.whenJoinedFanklub == e2?.whenJoinedFanklub &&
        e1?.tshirt == e2?.tshirt;
  }

  @override
  int hash(FanklubRecord? e) => const ListEquality()
      .hash([e?.userId, e?.name, e?.email, e?.whenJoinedFanklub, e?.tshirt]);

  @override
  bool isValidKey(Object? o) => o is FanklubRecord;
}
