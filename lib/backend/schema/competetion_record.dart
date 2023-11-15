import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class CompetetionRecord extends FirestoreRecord {
  CompetetionRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "title" field.
  String? _title;
  String get title => _title ?? '';
  bool hasTitle() => _title != null;

  // "on_floor_competition" field.
  bool? _onFloorCompetition;
  bool get onFloorCompetition => _onFloorCompetition ?? false;
  bool hasOnFloorCompetition() => _onFloorCompetition != null;

  // "gift_title" field.
  String? _giftTitle;
  String get giftTitle => _giftTitle ?? '';
  bool hasGiftTitle() => _giftTitle != null;

  // "gift_image" field.
  String? _giftImage;
  String get giftImage => _giftImage ?? '';
  bool hasGiftImage() => _giftImage != null;

  // "sponsor" field.
  String? _sponsor;
  String get sponsor => _sponsor ?? '';
  bool hasSponsor() => _sponsor != null;

  // "users" field.
  List<DocumentReference>? _users;
  List<DocumentReference> get users => _users ?? const [];
  bool hasUsers() => _users != null;

  // "winners" field.
  List<DocumentReference>? _winners;
  List<DocumentReference> get winners => _winners ?? const [];
  bool hasWinners() => _winners != null;

  // "onFloors" field.
  List<DocumentReference>? _onFloors;
  List<DocumentReference> get onFloors => _onFloors ?? const [];
  bool hasOnFloors() => _onFloors != null;

  void _initializeFields() {
    _title = snapshotData['title'] as String?;
    _onFloorCompetition = snapshotData['on_floor_competition'] as bool?;
    _giftTitle = snapshotData['gift_title'] as String?;
    _giftImage = snapshotData['gift_image'] as String?;
    _sponsor = snapshotData['sponsor'] as String?;
    _users = getDataList(snapshotData['users']);
    _winners = getDataList(snapshotData['winners']);
    _onFloors = getDataList(snapshotData['onFloors']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('competetion');

  static Stream<CompetetionRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => CompetetionRecord.fromSnapshot(s));

  static Future<CompetetionRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => CompetetionRecord.fromSnapshot(s));

  static CompetetionRecord fromSnapshot(DocumentSnapshot snapshot) =>
      CompetetionRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static CompetetionRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      CompetetionRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'CompetetionRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is CompetetionRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createCompetetionRecordData({
  String? title,
  bool? onFloorCompetition,
  String? giftTitle,
  String? giftImage,
  String? sponsor,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'title': title,
      'on_floor_competition': onFloorCompetition,
      'gift_title': giftTitle,
      'gift_image': giftImage,
      'sponsor': sponsor,
    }.withoutNulls,
  );

  return firestoreData;
}

class CompetetionRecordDocumentEquality implements Equality<CompetetionRecord> {
  const CompetetionRecordDocumentEquality();

  @override
  bool equals(CompetetionRecord? e1, CompetetionRecord? e2) {
    const listEquality = ListEquality();
    return e1?.title == e2?.title &&
        e1?.onFloorCompetition == e2?.onFloorCompetition &&
        e1?.giftTitle == e2?.giftTitle &&
        e1?.giftImage == e2?.giftImage &&
        e1?.sponsor == e2?.sponsor &&
        listEquality.equals(e1?.users, e2?.users) &&
        listEquality.equals(e1?.winners, e2?.winners) &&
        listEquality.equals(e1?.onFloors, e2?.onFloors);
  }

  @override
  int hash(CompetetionRecord? e) => const ListEquality().hash([
        e?.title,
        e?.onFloorCompetition,
        e?.giftTitle,
        e?.giftImage,
        e?.sponsor,
        e?.users,
        e?.winners,
        e?.onFloors
      ]);

  @override
  bool isValidKey(Object? o) => o is CompetetionRecord;
}
