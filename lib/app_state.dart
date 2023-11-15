import 'package:flutter/material.dart';
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import 'backend/api_requests/api_manager.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:csv/csv.dart';
import 'package:synchronized/synchronized.dart';
import 'flutter_flow/flutter_flow_util.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    secureStorage = FlutterSecureStorage();
    await _safeInitAsync(() async {
      _Players = (await secureStorage.getStringList('ff_Players'))
              ?.map((x) {
                try {
                  return PlayerStruct.fromSerializableMap(jsonDecode(x));
                } catch (e) {
                  print("Can't decode persisted data type. Error: $e.");
                  return null;
                }
              })
              .withoutNulls
              .toList() ??
          _Players;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late FlutterSecureStorage secureStorage;

  List<PlayerStruct> _Players = [
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Andrew Reamírez\",\"number\":\"2\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/4w63gbg3yv58/BC_Copenhagen-22.jpg\\\"]\",\"height\":\"186 cm\",\"year\":\"1997\",\"home_country\":\"Spanien\",\"position\":\"Guard\",\"bio\":\"Vores kaptajn. Andrew er en af de erfarne spillere på holdet. Han har sin basketballopvækst i Spanien og har tidligere været en del af Spaniens ungdomslandshold. Før han kom til holdet spillede han i Spanien og har været forbi collegebasketball i USA. Du kan forvente flot spil, høj spilforståelse, præcise afleveringer og mange point fra Andrew.\",\"is_liked\":\"false\",\"short_position\":\"G\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Durell Vinson\",\"number\":\"25\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/lzik6iywl1fy/BC_Copenhagen-25.jpg\\\"]\",\"height\":\"201 cm\",\"year\":\"1985\",\"home_country\":\"USA\",\"position\":\"Center\",\"bio\":\"Durell er den ældste og mest erfarne spiller på holdet, og leverer en masse tyngde og stabilitet sammen med sin stærke attitude. Brølstærk under kurven og du kan forvente rebounds og scoringer under kurven.\",\"is_liked\":\"false\",\"short_position\":\"C\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Martin Poulsen\",\"number\":\"10\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/z5slomqhciow/BC_Copenhagen-20.jpg\\\"]\",\"height\":\"195 cm\",\"year\":\"1998\",\"home_country\":\"Denmark\",\"position\":\"Guard\",\"bio\":\"Martin er en erfaren spiller og har tidligere spillet i Basketligaen hos bl.a. Næstved og Værløse. Han er også inde omkring Herre-landsholdet og du kan forvente fantastisk spil med et uovertruffent blik for spillet, mange point og en stærk defense.\",\"is_liked\":\"false\",\"short_position\":\"G\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Mathias Bak Christensen\",\"number\":\"37\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/35bpe79ry4tr/BC_Copenhagen-18.jpg\\\"]\",\"height\":\"204 cm\",\"year\":\"1995\",\"home_country\":\"Danmark\",\"position\":\"Forward\",\"bio\":\"Matthias er en erfaren spiller og har tidligere spillet i Basketligaen hos bl.a. Næstved og Værløse. Har tidligere været inde omkring landsholdet og du kan forvente stærk fight, mange point, stærk defense og en spiller, som gør hele holdet bedre.\",\"is_liked\":\"false\",\"short_position\":\"F\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Rasmus Secher Whinther\",\"number\":\"5\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/tyhb2eoeykmn/BC_Copenhagen-14.jpg\\\"]\",\"height\":\"197 cm\",\"year\":\"2002\",\"home_country\":\"Danmark\",\"position\":\"Shooting Guard\",\"bio\":\"Rasmus har en fortid i Virum Basketball klub og på EVN efterskole. Han er en ung meget lovende shooting guard, og vi har store forventninger til hans sæson i år – specielt bag 3-points linjen.\",\"is_liked\":\"false\",\"short_position\":\"SG\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"William Vang\",\"number\":\"8\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/69jj0gzf22j6/BC_Copenhagen-24.jpg\\\"]\",\"height\":\"190 cm\",\"year\":\"2001\",\"home_country\":\"Danmark\",\"position\":\"Guard\",\"bio\":\"William er en yngre meget talentfuld spiller med et par års erfaring fra Basketligaen hos Holbæk Stenhus og i ungdomsårene var han en succesfuld guard hos BK Amager. Han er ny på holdet og med hans attitude og basketball egenskaber vil han skabe flot spil, spændende moves og gøre holdet endnu bedre.\",\"is_liked\":\"false\",\"short_position\":\"G\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Laurits Halstad\",\"number\":\"14\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/8rgi0c1f8odx/BC_Copenhagen-12.jpg\\\"]\",\"height\":\"214 cm\",\"year\":\"2003\",\"home_country\":\"Danmark\",\"position\":\"Center\",\"bio\":\"Laurits er en spændende ung profil, der med sin fysiske ramme og energi bringer en masse til holdet. Han er et produkt af ungdomslandholdsprogrammet og er på nuværende tidspunkt en del af u20 projektet, og har som u16 bl.a. vundet bronze ved EM. Du skal forvente masser af fysik under kurven og brøl fra bænken.\",\"is_liked\":\"false\",\"short_position\":\"C\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Marko Veljic\",\"number\":\"6\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/494s3cip78h1/BC_Copenhagen-8.jpg\\\"]\",\"height\":\"189 cm\",\"year\":\"2000\",\"home_country\":\"Danmark\",\"position\":\"Guard\",\"bio\":\"Marko er en yngre erfaren spiller og har spillet i Basketligaen hos Værløse. Han er ny på holdet og med hans hurtighed, blik for spillet og stærke 3-point skud kan I forvente mange fede oplevelser.\",\"is_liked\":\"false\",\"short_position\":\"G\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Thomas Buch\",\"number\":\"44\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/atsj95qbj4x9/BC_Copenhagen-2.jpg\\\"]\",\"height\":\"201 cm\",\"year\":\"2005\",\"home_country\":\"Danmark\",\"position\":\"Forward/Center\",\"bio\":\"Thomas kommer fra vores talentsamarbejde med Ajax København Sportsgymnasium og har en ungdomsfortid i Virum. Han er en alsidig spiller med et kæmpe vindergen og er inde omkring det succesfulde U18 landshold. Du kan forvente masser af intensitet, attitude og en stærk defense.\",\"is_liked\":\"false\",\"short_position\":\"F/C\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Stevan Novovic\",\"number\":\"9\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/c12txcyrcbo1/BC_Copenhagen-34.jpg\\\"]\",\"height\":\"198 cm\",\"year\":\"2006\",\"home_country\":\"Danmark\",\"position\":\"Guard\",\"bio\":\"Stevan er fast mand på det succesfulde U18 landshold og spiller på dobbelt-licens hos Falcon. Han er et af de store guard talenter i Danmark og I skal forvente en storspiller i svøb, som kan det hele med bolden – drible, cut through, scoringer.\",\"is_liked\":\"false\",\"short_position\":\"G\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Marius Øllegaard\",\"number\":\"12\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/4g4gah6jpmrb/BC_Copenhagen-4.jpg\\\"]\",\"height\":\"190 cm\",\"year\":\"2004\",\"home_country\":\"Danmark\",\"position\":\"Guard\",\"bio\":\"Marius kommer også fra vores talentsamarbejde med Ajax København Sportsgymnasium og har allerede spillet lidt Basketliga sidste år for os. Han har nogle helt unikke basketball\",\"is_liked\":\"false\",\"short_position\":\"G\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bilal Raymond\",\"number\":\"11\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/5e4b4tazpikz/BC_Copenhagen-6.jpg\\\"]\",\"height\":\"188 cm\",\"year\":\"2006\",\"home_country\":\"Danmark\",\"position\":\"Guard\",\"bio\":\"Bilal er en utrolig spændende point guard og også fast mand på ungdomslandsholdene og spiller med dobbeltlicens hos Falcon og dermed en del af vores talentsamarbejde med Falcon. Du skal forvente flot spil, gennembrud med flotte driblinger og flotte 3-point scoringer.\",\"is_liked\":\"false\",\"short_position\":\"G\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Per Christian Brandt (PC)\",\"number\":\"17\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/hzgce4vyrlk8/BC_Copenhagen-16.jpg\\\"]\",\"height\":\"201 cm\",\"year\":\"2004\",\"home_country\":\"Danmark\",\"position\":\"Guard/Forward\",\"bio\":\"PC er et af de store talenter fra vores samarbejde med Ajax København Sportsgymnasium. Han er stærk med bolden og i sine afslutninger. Desværre er han stadig i genoptræning efter sin korsbåndskade. I kan glæde jer til han er tilbage.\",\"is_liked\":\"false\",\"short_position\":\"G/F\"}')),
    PlayerStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Willads Møller\",\"number\":\"55\",\"images\":\"[\\\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/pc9sg6d6nt3c/BC_Copenhagen-10.jpg\\\"]\",\"height\":\"196 cm\",\"year\":\"2006\",\"home_country\":\"Danmark\",\"position\":\"Guard/Forward\",\"bio\":\"Willads er også en spiller med dobbelt-licens hos Falcon og en del af vores talentsamarbejde med Falcon. Han spiller på ungdoms landsholdene og du kan forvente masser af fight, stærk defense og gennembrud. En meget spændende spiller, som træder ind på højeste niveau.\",\"is_liked\":\"false\",\"short_position\":\"G/F\"}'))
  ];
  List<PlayerStruct> get Players => _Players;
  set Players(List<PlayerStruct> _value) {
    _Players = _value;
    secureStorage.setStringList(
        'ff_Players', _value.map((x) => x.serialize()).toList());
  }

  void deletePlayers() {
    secureStorage.delete(key: 'ff_Players');
  }

  void addToPlayers(PlayerStruct _value) {
    _Players.add(_value);
    secureStorage.setStringList(
        'ff_Players', _Players.map((x) => x.serialize()).toList());
  }

  void removeFromPlayers(PlayerStruct _value) {
    _Players.remove(_value);
    secureStorage.setStringList(
        'ff_Players', _Players.map((x) => x.serialize()).toList());
  }

  void removeAtIndexFromPlayers(int _index) {
    _Players.removeAt(_index);
    secureStorage.setStringList(
        'ff_Players', _Players.map((x) => x.serialize()).toList());
  }

  void updatePlayersAtIndex(
    int _index,
    PlayerStruct Function(PlayerStruct) updateFn,
  ) {
    _Players[_index] = updateFn(_Players[_index]);
    secureStorage.setStringList(
        'ff_Players', _Players.map((x) => x.serialize()).toList());
  }

  void insertAtIndexInPlayers(int _index, PlayerStruct _value) {
    _Players.insert(_index, _value);
    secureStorage.setStringList(
        'ff_Players', _Players.map((x) => x.serialize()).toList());
  }

  List<SponsorStruct> _Sponsorater = [
    SponsorStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"BC Copenhagen\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/1xanigs1ziu0/BCC-Emblem-BW-01.png\",\"cover_image\":\"https://picsum.photos/seed/558/600\"}')),
    SponsorStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"AKS\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/1xanigs1ziu0/BCC-Emblem-BW-01.png\",\"cover_image\":\"https://picsum.photos/seed/637/600\"}'))
  ];
  List<SponsorStruct> get Sponsorater => _Sponsorater;
  set Sponsorater(List<SponsorStruct> _value) {
    _Sponsorater = _value;
  }

  void addToSponsorater(SponsorStruct _value) {
    _Sponsorater.add(_value);
  }

  void removeFromSponsorater(SponsorStruct _value) {
    _Sponsorater.remove(_value);
  }

  void removeAtIndexFromSponsorater(int _index) {
    _Sponsorater.removeAt(_index);
  }

  void updateSponsoraterAtIndex(
    int _index,
    SponsorStruct Function(SponsorStruct) updateFn,
  ) {
    _Sponsorater[_index] = updateFn(_Sponsorater[_index]);
  }

  void insertAtIndexInSponsorater(int _index, SponsorStruct _value) {
    _Sponsorater.insert(_index, _value);
  }

  List<String> _Images = [
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/cuie1jaumu9s/IHs4IqipeWFJPIqx4Ix9.jpg',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/kz0aynsdi1vz/bc_copenhagen_vs_naestved-8.jpg',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/kyac9cfzo15t/bc_copenhagen_vs_bk_amager-12.jpg',
    'https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/kdm5sbzh2odp/bc_copenhagen_vs_næstved-5.jpg'
  ];
  List<String> get Images => _Images;
  set Images(List<String> _value) {
    _Images = _value;
  }

  void addToImages(String _value) {
    _Images.add(_value);
  }

  void removeFromImages(String _value) {
    _Images.remove(_value);
  }

  void removeAtIndexFromImages(int _index) {
    _Images.removeAt(_index);
  }

  void updateImagesAtIndex(
    int _index,
    String Function(String) updateFn,
  ) {
    _Images[_index] = updateFn(_Images[_index]);
  }

  void insertAtIndexInImages(int _index, String _value) {
    _Images.insert(_index, _value);
  }

  List<TilbudStruct> _TilbudList = [
    TilbudStruct.fromSerializableMap(jsonDecode(
        '{\"beskrivelse\":\"Bliv den bedste af de bedste indenfor Basketball\",\"billede\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/kz0aynsdi1vz/bc_copenhagen_vs_naestved-8.jpg\",\"sponsor_name\":\"AKS\",\"date\":\"1694445251841\"}'))
  ];
  List<TilbudStruct> get TilbudList => _TilbudList;
  set TilbudList(List<TilbudStruct> _value) {
    _TilbudList = _value;
  }

  void addToTilbudList(TilbudStruct _value) {
    _TilbudList.add(_value);
  }

  void removeFromTilbudList(TilbudStruct _value) {
    _TilbudList.remove(_value);
  }

  void removeAtIndexFromTilbudList(int _index) {
    _TilbudList.removeAt(_index);
  }

  void updateTilbudListAtIndex(
    int _index,
    TilbudStruct Function(TilbudStruct) updateFn,
  ) {
    _TilbudList[_index] = updateFn(_TilbudList[_index]);
  }

  void insertAtIndexInTilbudList(int _index, TilbudStruct _value) {
    _TilbudList.insert(_index, _value);
  }

  List<GameTicketStruct> _gameTickets = [
    GameTicketStruct.fromSerializableMap(jsonDecode(
        '{\"start_date\":\"1699034400000\",\"address\":\"55.700087,12.5435144\",\"description\":\"Kom og støt holdet i Nørrebrohallen - vi åbner dørene kl. 18.\",\"amount\":\"7500\",\"adress_name\":\"Nørebrohallen\",\"home_team\":\"0\",\"away_team\":\"9\",\"season\":\"2023/2024\",\"specialUid\":\"\"}')),
    GameTicketStruct.fromSerializableMap(jsonDecode(
        '{\"start_date\":\"1702144800000\",\"address\":\"55.64906829999999,12.5166018\",\"description\":\"Kæmpe kamp i Valbyhallen, hvor vi håber på 2.500 tilskuerer - kom og støt holdet til sejr. Vi åbner dørene kl. 17.30, hvor DJ\'en vil spille og fadøls baren er i gang.\",\"amount\":\"7500\",\"adress_name\":\"Valbyhallen\",\"home_team\":\"0\",\"away_team\":\"2\",\"season\":\"2023/2024\",\"specialUid\":\"\"}')),
    GameTicketStruct.fromSerializableMap(jsonDecode(
        '{\"start_date\":\"1702749600000\",\"address\":\"55.64906829999999,12.5166018\",\"description\":\"Så er der basketball dag i Valbyhallen - først spiller Ajax København Sportsgymnasium U19 mod Værløse U19 kl. 16.30. Herefter kommer den store kamp mod Værløse Bluehawks kl. 19. Vi åbner dørene fra kl. 16, hvor DJ\'en vil være på plads og fadøls baren er igang.\",\"amount\":\"7500\",\"adress_name\":\"Valbyhallen\",\"home_team\":\"0\",\"away_team\":\"5\",\"season\":\"2023/2024\",\"specialUid\":\"\"}'))
  ];
  List<GameTicketStruct> get gameTickets => _gameTickets;
  set gameTickets(List<GameTicketStruct> _value) {
    _gameTickets = _value;
  }

  void addToGameTickets(GameTicketStruct _value) {
    _gameTickets.add(_value);
  }

  void removeFromGameTickets(GameTicketStruct _value) {
    _gameTickets.remove(_value);
  }

  void removeAtIndexFromGameTickets(int _index) {
    _gameTickets.removeAt(_index);
  }

  void updateGameTicketsAtIndex(
    int _index,
    GameTicketStruct Function(GameTicketStruct) updateFn,
  ) {
    _gameTickets[_index] = updateFn(_gameTickets[_index]);
  }

  void insertAtIndexInGameTickets(int _index, GameTicketStruct _value) {
    _gameTickets.insert(_index, _value);
  }

  List<TeamsStruct> _teams = [
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"BC Copenhagen\",\"team_id\":\"bc_copenhagen\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/1xanigs1ziu0/BCC-Emblem-BW-01.png\",\"slug_name\":\"BCC\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"BMS Herlev\",\"team_id\":\"bms_herlev\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/y3x1vgcmcpw7/BMS-Herlev.png\",\"slug_name\":\"BMS\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bakken Bears\",\"team_id\":\"bakken_bears\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/hy9l7c5myk2e/logo-2.png\",\"slug_name\":\"BAC\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Horsens IC\",\"team_id\":\"horsens_ic\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/6e9j9akuz31a/logo-5.png\",\"slug_name\":\"HIC\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Randers Cimbria\",\"team_id\":\"randers_cimbria\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/p28icuyu8dwu/randers.png\",\"slug_name\":\"RAN\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Værløse Blue Hawks\",\"team_id\":\"værløse_blue_hawks\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/3p6gh1bneq0l/logo-8.png\",\"slug_name\":\"VBH\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Team FOG Næstved\",\"team_id\":\"team_fog_næstved\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/0bghooatezlj/logo-7.png\",\"slug_name\":\"TFN\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"BK Amager\",\"team_id\":\"bk_amager\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/ndvvr2tjaglc/logo-2-2.png\",\"slug_name\":\"BKA\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Svendborg Rabbits\",\"team_id\":\"svendborg_rabbits\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/1vkly109gmc9/logo-6.png\",\"slug_name\":\"SVE\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Bears Academy\",\"team_id\":\"bears_academy\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/5561nqz3pvhl/logo-1-2.png\",\"slug_name\":\"BAC\"}')),
    TeamsStruct.fromSerializableMap(jsonDecode(
        '{\"name\":\"Holbæk Stenhus\",\"team_id\":\"holbæk_stenhus\",\"image\":\"https://storage.googleapis.com/flutterflow-io-6f20.appspot.com/projects/b-c-copenhagen-zjvk27/assets/uapqx8s7vtr6/stenhus-logo.png\",\"slug_name\":\"HOL\"}'))
  ];
  List<TeamsStruct> get teams => _teams;
  set teams(List<TeamsStruct> _value) {
    _teams = _value;
  }

  void addToTeams(TeamsStruct _value) {
    _teams.add(_value);
  }

  void removeFromTeams(TeamsStruct _value) {
    _teams.remove(_value);
  }

  void removeAtIndexFromTeams(int _index) {
    _teams.removeAt(_index);
  }

  void updateTeamsAtIndex(
    int _index,
    TeamsStruct Function(TeamsStruct) updateFn,
  ) {
    _teams[_index] = updateFn(_teams[_index]);
  }

  void insertAtIndexInTeams(int _index, TeamsStruct _value) {
    _teams.insert(_index, _value);
  }

  String _currentSeason = '2023/2024';
  String get currentSeason => _currentSeason;
  set currentSeason(String _value) {
    _currentSeason = _value;
  }

  String _seasonCardDescription =
      'Du får gratis adgang til alle kampe i 2023/2024 sæsonen';
  String get seasonCardDescription => _seasonCardDescription;
  set seasonCardDescription(String _value) {
    _seasonCardDescription = _value;
  }

  String _vipCardDescription =
      'Du får gratis adgang til alle kampe i 2023/2024 sæsonen og gratis alkohol under alle kampene';
  String get vipCardDescription => _vipCardDescription;
  set vipCardDescription(String _value) {
    _vipCardDescription = _value;
  }
}

LatLng? _latLngFromString(String? val) {
  if (val == null) {
    return null;
  }
  final split = val.split(',');
  final lat = double.parse(split.first);
  final lng = double.parse(split.last);
  return LatLng(lat, lng);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}

extension FlutterSecureStorageExtensions on FlutterSecureStorage {
  static final _lock = Lock();

  Future<void> writeSync({required String key, String? value}) async =>
      await _lock.synchronized(() async {
        await write(key: key, value: value);
      });

  void remove(String key) => delete(key: key);

  Future<String?> getString(String key) async => await read(key: key);
  Future<void> setString(String key, String value) async =>
      await writeSync(key: key, value: value);

  Future<bool?> getBool(String key) async => (await read(key: key)) == 'true';
  Future<void> setBool(String key, bool value) async =>
      await writeSync(key: key, value: value.toString());

  Future<int?> getInt(String key) async =>
      int.tryParse(await read(key: key) ?? '');
  Future<void> setInt(String key, int value) async =>
      await writeSync(key: key, value: value.toString());

  Future<double?> getDouble(String key) async =>
      double.tryParse(await read(key: key) ?? '');
  Future<void> setDouble(String key, double value) async =>
      await writeSync(key: key, value: value.toString());

  Future<List<String>?> getStringList(String key) async =>
      await read(key: key).then((result) {
        if (result == null || result.isEmpty) {
          return null;
        }
        return CsvToListConverter()
            .convert(result)
            .first
            .map((e) => e.toString())
            .toList();
      });
  Future<void> setStringList(String key, List<String> value) async =>
      await writeSync(key: key, value: ListToCsvConverter().convert([value]));
}
