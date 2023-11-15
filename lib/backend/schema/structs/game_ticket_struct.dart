// ignore_for_file: unnecessary_getters_setters
import '/backend/algolia/serialization_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GameTicketStruct extends FFFirebaseStruct {
  GameTicketStruct({
    DateTime? startDate,
    LatLng? address,
    String? description,
    int? amount,
    String? adressName,
    int? homeTeam,
    int? awayTeam,
    String? season,
    String? specialUid,
    FirestoreUtilData firestoreUtilData = const FirestoreUtilData(),
  })  : _startDate = startDate,
        _address = address,
        _description = description,
        _amount = amount,
        _adressName = adressName,
        _homeTeam = homeTeam,
        _awayTeam = awayTeam,
        _season = season,
        _specialUid = specialUid,
        super(firestoreUtilData);

  // "start_date" field.
  DateTime? _startDate;
  DateTime? get startDate => _startDate;
  set startDate(DateTime? val) => _startDate = val;
  bool hasStartDate() => _startDate != null;

  // "address" field.
  LatLng? _address;
  LatLng? get address => _address;
  set address(LatLng? val) => _address = val;
  bool hasAddress() => _address != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  set description(String? val) => _description = val;
  bool hasDescription() => _description != null;

  // "amount" field.
  int? _amount;
  int get amount => _amount ?? 0;
  set amount(int? val) => _amount = val;
  void incrementAmount(int amount) => _amount = amount + amount;
  bool hasAmount() => _amount != null;

  // "adress_name" field.
  String? _adressName;
  String get adressName => _adressName ?? '';
  set adressName(String? val) => _adressName = val;
  bool hasAdressName() => _adressName != null;

  // "home_team" field.
  int? _homeTeam;
  int get homeTeam => _homeTeam ?? 0;
  set homeTeam(int? val) => _homeTeam = val;
  void incrementHomeTeam(int amount) => _homeTeam = homeTeam + amount;
  bool hasHomeTeam() => _homeTeam != null;

  // "away_team" field.
  int? _awayTeam;
  int get awayTeam => _awayTeam ?? 0;
  set awayTeam(int? val) => _awayTeam = val;
  void incrementAwayTeam(int amount) => _awayTeam = awayTeam + amount;
  bool hasAwayTeam() => _awayTeam != null;

  // "season" field.
  String? _season;
  String get season => _season ?? '';
  set season(String? val) => _season = val;
  bool hasSeason() => _season != null;

  // "specialUid" field.
  String? _specialUid;
  String get specialUid => _specialUid ?? '';
  set specialUid(String? val) => _specialUid = val;
  bool hasSpecialUid() => _specialUid != null;

  static GameTicketStruct fromMap(Map<String, dynamic> data) =>
      GameTicketStruct(
        startDate: data['start_date'] as DateTime?,
        address: data['address'] as LatLng?,
        description: data['description'] as String?,
        amount: castToType<int>(data['amount']),
        adressName: data['adress_name'] as String?,
        homeTeam: castToType<int>(data['home_team']),
        awayTeam: castToType<int>(data['away_team']),
        season: data['season'] as String?,
        specialUid: data['specialUid'] as String?,
      );

  static GameTicketStruct? maybeFromMap(dynamic data) =>
      data is Map<String, dynamic> ? GameTicketStruct.fromMap(data) : null;

  Map<String, dynamic> toMap() => {
        'start_date': _startDate,
        'address': _address,
        'description': _description,
        'amount': _amount,
        'adress_name': _adressName,
        'home_team': _homeTeam,
        'away_team': _awayTeam,
        'season': _season,
        'specialUid': _specialUid,
      }.withoutNulls;

  @override
  Map<String, dynamic> toSerializableMap() => {
        'start_date': serializeParam(
          _startDate,
          ParamType.DateTime,
        ),
        'address': serializeParam(
          _address,
          ParamType.LatLng,
        ),
        'description': serializeParam(
          _description,
          ParamType.String,
        ),
        'amount': serializeParam(
          _amount,
          ParamType.int,
        ),
        'adress_name': serializeParam(
          _adressName,
          ParamType.String,
        ),
        'home_team': serializeParam(
          _homeTeam,
          ParamType.int,
        ),
        'away_team': serializeParam(
          _awayTeam,
          ParamType.int,
        ),
        'season': serializeParam(
          _season,
          ParamType.String,
        ),
        'specialUid': serializeParam(
          _specialUid,
          ParamType.String,
        ),
      }.withoutNulls;

  static GameTicketStruct fromSerializableMap(Map<String, dynamic> data) =>
      GameTicketStruct(
        startDate: deserializeParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        address: deserializeParam(
          data['address'],
          ParamType.LatLng,
          false,
        ),
        description: deserializeParam(
          data['description'],
          ParamType.String,
          false,
        ),
        amount: deserializeParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        adressName: deserializeParam(
          data['adress_name'],
          ParamType.String,
          false,
        ),
        homeTeam: deserializeParam(
          data['home_team'],
          ParamType.int,
          false,
        ),
        awayTeam: deserializeParam(
          data['away_team'],
          ParamType.int,
          false,
        ),
        season: deserializeParam(
          data['season'],
          ParamType.String,
          false,
        ),
        specialUid: deserializeParam(
          data['specialUid'],
          ParamType.String,
          false,
        ),
      );

  static GameTicketStruct fromAlgoliaData(Map<String, dynamic> data) =>
      GameTicketStruct(
        startDate: convertAlgoliaParam(
          data['start_date'],
          ParamType.DateTime,
          false,
        ),
        address: convertAlgoliaParam(
          data,
          ParamType.LatLng,
          false,
        ),
        description: convertAlgoliaParam(
          data['description'],
          ParamType.String,
          false,
        ),
        amount: convertAlgoliaParam(
          data['amount'],
          ParamType.int,
          false,
        ),
        adressName: convertAlgoliaParam(
          data['adress_name'],
          ParamType.String,
          false,
        ),
        homeTeam: convertAlgoliaParam(
          data['home_team'],
          ParamType.int,
          false,
        ),
        awayTeam: convertAlgoliaParam(
          data['away_team'],
          ParamType.int,
          false,
        ),
        season: convertAlgoliaParam(
          data['season'],
          ParamType.String,
          false,
        ),
        specialUid: convertAlgoliaParam(
          data['specialUid'],
          ParamType.String,
          false,
        ),
        firestoreUtilData: FirestoreUtilData(
          clearUnsetFields: false,
          create: true,
        ),
      );

  @override
  String toString() => 'GameTicketStruct(${toMap()})';

  @override
  bool operator ==(Object other) {
    return other is GameTicketStruct &&
        startDate == other.startDate &&
        address == other.address &&
        description == other.description &&
        amount == other.amount &&
        adressName == other.adressName &&
        homeTeam == other.homeTeam &&
        awayTeam == other.awayTeam &&
        season == other.season &&
        specialUid == other.specialUid;
  }

  @override
  int get hashCode => const ListEquality().hash([
        startDate,
        address,
        description,
        amount,
        adressName,
        homeTeam,
        awayTeam,
        season,
        specialUid
      ]);
}

GameTicketStruct createGameTicketStruct({
  DateTime? startDate,
  LatLng? address,
  String? description,
  int? amount,
  String? adressName,
  int? homeTeam,
  int? awayTeam,
  String? season,
  String? specialUid,
  Map<String, dynamic> fieldValues = const {},
  bool clearUnsetFields = true,
  bool create = false,
  bool delete = false,
}) =>
    GameTicketStruct(
      startDate: startDate,
      address: address,
      description: description,
      amount: amount,
      adressName: adressName,
      homeTeam: homeTeam,
      awayTeam: awayTeam,
      season: season,
      specialUid: specialUid,
      firestoreUtilData: FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
        delete: delete,
        fieldValues: fieldValues,
      ),
    );

GameTicketStruct? updateGameTicketStruct(
  GameTicketStruct? gameTicket, {
  bool clearUnsetFields = true,
  bool create = false,
}) =>
    gameTicket
      ?..firestoreUtilData = FirestoreUtilData(
        clearUnsetFields: clearUnsetFields,
        create: create,
      );

void addGameTicketStructData(
  Map<String, dynamic> firestoreData,
  GameTicketStruct? gameTicket,
  String fieldName, [
  bool forFieldValue = false,
]) {
  firestoreData.remove(fieldName);
  if (gameTicket == null) {
    return;
  }
  if (gameTicket.firestoreUtilData.delete) {
    firestoreData[fieldName] = FieldValue.delete();
    return;
  }
  final clearFields =
      !forFieldValue && gameTicket.firestoreUtilData.clearUnsetFields;
  if (clearFields) {
    firestoreData[fieldName] = <String, dynamic>{};
  }
  final gameTicketData = getGameTicketFirestoreData(gameTicket, forFieldValue);
  final nestedData = gameTicketData.map((k, v) => MapEntry('$fieldName.$k', v));

  final mergeFields = gameTicket.firestoreUtilData.create || clearFields;
  firestoreData
      .addAll(mergeFields ? mergeNestedFields(nestedData) : nestedData);
}

Map<String, dynamic> getGameTicketFirestoreData(
  GameTicketStruct? gameTicket, [
  bool forFieldValue = false,
]) {
  if (gameTicket == null) {
    return {};
  }
  final firestoreData = mapToFirestore(gameTicket.toMap());

  // Add any Firestore field values
  gameTicket.firestoreUtilData.fieldValues
      .forEach((k, v) => firestoreData[k] = v);

  return forFieldValue ? mergeNestedFields(firestoreData) : firestoreData;
}

List<Map<String, dynamic>> getGameTicketListFirestoreData(
  List<GameTicketStruct>? gameTickets,
) =>
    gameTickets?.map((e) => getGameTicketFirestoreData(e, true)).toList() ?? [];
