import 'dart:async';

import 'package:from_css_color/from_css_color.dart';
import '/backend/algolia/serialization_util.dart';
import '/backend/algolia/algolia_manager.dart';
import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "gifts" field.
  List<GiftStruct>? _gifts;
  List<GiftStruct> get gifts => _gifts ?? const [];
  bool hasGifts() => _gifts != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "is_in_fanklub" field.
  bool? _isInFanklub;
  bool get isInFanklub => _isInFanklub ?? false;
  bool hasIsInFanklub() => _isInFanklub != null;

  // "vip_color" field.
  Color? _vipColor;
  Color? get vipColor => _vipColor;
  bool hasVipColor() => _vipColor != null;

  // "vip_text" field.
  String? _vipText;
  String get vipText => _vipText ?? '';
  bool hasVipText() => _vipText != null;

  // "is_vip" field.
  bool? _isVip;
  bool get isVip => _isVip ?? false;
  bool hasIsVip() => _isVip != null;

  // "vipTicketSeason" field.
  String? _vipTicketSeason;
  String get vipTicketSeason => _vipTicketSeason ?? '';
  bool hasVipTicketSeason() => _vipTicketSeason != null;

  // "seasonTicketSeason" field.
  String? _seasonTicketSeason;
  String get seasonTicketSeason => _seasonTicketSeason ?? '';
  bool hasSeasonTicketSeason() => _seasonTicketSeason != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _gifts = getStructList(
      snapshotData['gifts'],
      GiftStruct.fromMap,
    );
    _birthday = snapshotData['birthday'] as DateTime?;
    _isInFanklub = snapshotData['is_in_fanklub'] as bool?;
    _vipColor = getSchemaColor(snapshotData['vip_color']);
    _vipText = snapshotData['vip_text'] as String?;
    _isVip = snapshotData['is_vip'] as bool?;
    _vipTicketSeason = snapshotData['vipTicketSeason'] as String?;
    _seasonTicketSeason = snapshotData['seasonTicketSeason'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  static UsersRecord fromAlgolia(AlgoliaObjectSnapshot snapshot) =>
      UsersRecord.getDocumentFromData(
        {
          'email': snapshot.data['email'],
          'display_name': snapshot.data['display_name'],
          'photo_url': snapshot.data['photo_url'],
          'uid': snapshot.data['uid'],
          'created_time': convertAlgoliaParam(
            snapshot.data['created_time'],
            ParamType.DateTime,
            false,
          ),
          'phone_number': snapshot.data['phone_number'],
          'gifts': safeGet(
            () => (snapshot.data['gifts'] as Iterable)
                .map((d) => GiftStruct.fromAlgoliaData(d))
                .toList(),
          ),
          'birthday': convertAlgoliaParam(
            snapshot.data['birthday'],
            ParamType.DateTime,
            false,
          ),
          'is_in_fanklub': snapshot.data['is_in_fanklub'],
          'vip_color': convertAlgoliaParam(
            snapshot.data['vip_color'],
            ParamType.Color,
            false,
          ),
          'vip_text': snapshot.data['vip_text'],
          'is_vip': snapshot.data['is_vip'],
          'vipTicketSeason': snapshot.data['vipTicketSeason'],
          'seasonTicketSeason': snapshot.data['seasonTicketSeason'],
        },
        UsersRecord.collection.doc(snapshot.objectID),
      );

  static Future<List<UsersRecord>> search({
    String? term,
    FutureOr<LatLng>? location,
    int? maxResults,
    double? searchRadiusMeters,
    bool useCache = false,
  }) =>
      FFAlgoliaManager.instance
          .algoliaQuery(
            index: 'users',
            term: term,
            maxResults: maxResults,
            location: location,
            searchRadiusMeters: searchRadiusMeters,
            useCache: useCache,
          )
          .then((r) => r.map(fromAlgolia).toList());

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  DateTime? birthday,
  bool? isInFanklub,
  Color? vipColor,
  String? vipText,
  bool? isVip,
  String? vipTicketSeason,
  String? seasonTicketSeason,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'birthday': birthday,
      'is_in_fanklub': isInFanklub,
      'vip_color': vipColor,
      'vip_text': vipText,
      'is_vip': isVip,
      'vipTicketSeason': vipTicketSeason,
      'seasonTicketSeason': seasonTicketSeason,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        listEquality.equals(e1?.gifts, e2?.gifts) &&
        e1?.birthday == e2?.birthday &&
        e1?.isInFanklub == e2?.isInFanklub &&
        e1?.vipColor == e2?.vipColor &&
        e1?.vipText == e2?.vipText &&
        e1?.isVip == e2?.isVip &&
        e1?.vipTicketSeason == e2?.vipTicketSeason &&
        e1?.seasonTicketSeason == e2?.seasonTicketSeason;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.gifts,
        e?.birthday,
        e?.isInFanklub,
        e?.vipColor,
        e?.vipText,
        e?.isVip,
        e?.vipTicketSeason,
        e?.seasonTicketSeason
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
