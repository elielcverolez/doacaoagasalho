import 'dart:convert';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class BuscarCidadeCall {
  static Future<ApiCallResponse> call({
    String? uf = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarCidade',
      apiUrl:
          'https://servicodados.ibge.gov.br/api/v1/localidades/estados/${uf}/distritos',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class BuscarTodasCidadeCall {
  static Future<ApiCallResponse> call() async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarTodasCidade',
      apiUrl: 'https://servicodados.ibge.gov.br/api/v1/localidades/distritos',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static List<String>? cidades(dynamic response) => (getJsonField(
        response,
        r'''$[:].nome''',
        true,
      ) as List?)
          ?.withoutNulls
          .map((x) => castToType<String>(x))
          .withoutNulls
          .toList();
}

class BuscarPontosCall {
  static Future<ApiCallResponse> call({
    String? busca = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'BuscarPontos',
      apiUrl:
          'https://fxorjrulbgcrdlylwfma.supabase.co/rest/v1/ponto?select=*&or=(nome.ilike.*${busca}*,rua.ilike.*${busca}*,cidade.ilike.*${busca}*)',
      callType: ApiCallType.GET,
      headers: {
        'apikey':
            'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImZ4b3JqcnVsYmdjcmRseWx3Zm1hIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTcxNzgzNDIsImV4cCI6MjAzMjc1NDM0Mn0.04Spo63Zj_Q_quvx6xPbrdWcIuLntsishXZjlU_EFbs',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? nome(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].nome''',
      ));
  static String? rua(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].rua''',
      ));
  static String? numero(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].numero''',
      ));
  static String? bairro(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].bairro''',
      ));
  static String? cidade(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].cidade''',
      ));
  static String? estado(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$[:].estado''',
      ));
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

String _toEncodable(dynamic item) {
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
