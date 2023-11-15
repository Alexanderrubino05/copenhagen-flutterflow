import 'dart:convert';
import 'dart:typed_data';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class CreatePaymentCall {
  static Future<ApiCallResponse> call({
    int? amount = 1250,
    String? description =
        'Details on the product/service that the customer is buying',
    String? referenceString = 'my-reff',
    String? idempotencyKey = '726a6004-d0e8-8b08-52b0-9442c52f1d14',
    String? redirectPath = ' bccopenhagen://bccopenhagen.com/TicketPage',
  }) async {
    final ffApiRequestBody = '''
{
  "amount": ${amount},
  "idempotencyKey": "${idempotencyKey}",
  "paymentPointId": "da7179c7-5837-44e1-931a-c04bae89eb85",
  "redirectUri": "bccopenhagen://bccopenhagen.com/BoughtTicketsPage",
  "reference": "my-ref",
  "description": "${description}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'createPayment',
      apiUrl: 'https://api.sandbox.mobilepay.dk/v1/payments',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer E52781FE07E21577BACDCF1E2C884E6D0B6E3291F3A9B3461862DB3CFE668640',
        'Content-Type': 'application/json',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class FetchPaymentCall {
  static Future<ApiCallResponse> call({
    String? paymentID = '50c6ceed-c7ef-4056-985f-9f840575f0bd',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'fetchPayment',
      apiUrl: 'https://api.sandbox.mobilepay.dk/v1/payments/${paymentID}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization':
            'Bearer E52781FE07E21577BACDCF1E2C884E6D0B6E3291F3A9B3461862DB3CFE668640',
      },
      params: {
        'paymentId': paymentID,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CapturePaymentCall {
  static Future<ApiCallResponse> call({
    int? amount = 1,
    String? paymentId = 'fcfc9566-d199-4001-8372-599bcb15d299',
  }) async {
    final ffApiRequestBody = '''
{
  "amount": ${amount}
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'capturePayment',
      apiUrl:
          'https://api.sandbox.mobilepay.dk/v1/payments/${paymentId}/capture',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer E52781FE07E21577BACDCF1E2C884E6D0B6E3291F3A9B3461862DB3CFE668640',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class CancelPaymentCall {
  static Future<ApiCallResponse> call({
    String? paymentId = '9c698965-219c-4c21-9cf9-646089b4cfcf',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'cancelPayment',
      apiUrl:
          'https://api.sandbox.mobilepay.dk/v1/payments/${paymentId}/cancel',
      callType: ApiCallType.POST,
      headers: {
        'Authorization':
            'Bearer E52781FE07E21577BACDCF1E2C884E6D0B6E3291F3A9B3461862DB3CFE668640',
      },
      params: {},
      bodyType: BodyType.NONE,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
    );
  }
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
