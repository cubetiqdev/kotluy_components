// ignore_for_file: non_constant_identifier_names

import 'package:flutter_components/console/console.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService {
  final String? url;

  GraphQlService({this.url});

  String base_url = 'https://kotluy-api-dev.ctdn.dev/front/graphql';

//////////////////////////////////////////////////////////////////////////////////////////
  Future<void> queryDataNoAuth({
    required String query,
    required Function onSuccess,
    required Function onError,
  }) async {
    HttpLink httpLink = HttpLink(
      url ?? base_url,
    );

    GraphQLClient qlClient = GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: httpLink,
    );

    QueryResult result = await qlClient.query(
      QueryOptions(
        document: gql(
          query,
        ),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    if (result.hasException) {
      onError(result.exception!.graphqlErrors[0].message);
    } else if (!result.hasException) {
      onSuccess(result.data);
    } else {
      return Future.value(null);
    }
  }

  ///Example
  ///
  ///var response;
  ///
  ///callBack: (data) {
  ///
  /// response = YourResponseModel().fromMap(data['Field Name']);
  ///
  /// },

  Future<void> queryDataWithAuth({
    required String query,
    required String? accessToken,
    required Function onSuccess,
    required Function onError,
  }) async {
    HttpLink httpLink = HttpLink(
      url ?? base_url,
      defaultHeaders: <String, String>{'Authorization': 'Bearer $accessToken'},
    );
    GraphQLClient qlClient = GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: httpLink,
    );

    QueryResult result = await qlClient.query(
      QueryOptions(
        document: gql(
          query,
        ),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    if (result.hasException) {
      onError(result.exception!.graphqlErrors[0].message);
    } else if (!result.hasException) {
      onSuccess(result.data);
    } else {
      return Future.value(null);
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  Future<void> mutationDataWithNoAuth({
    required String mutation,
    required Function onSuccess,
    required Function onError,
  }) async {
    HttpLink httpLink = HttpLink(
      url ?? base_url,
    );

    GraphQLClient qlClient = GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: httpLink,
    );

    QueryResult result = await qlClient.query(
      QueryOptions(
        document: gql(
          mutation,
        ),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    if (result.hasException) {
      onError(result.exception!.graphqlErrors[0].message);
      Console.error("Error", result.exception);
    } else if (!result.hasException) {
      onSuccess(result.data);
    } else {
      return Future.value(null);
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  Future<void> mutationDataWithAuth({
    required String mutation,
    required String? accessToken,
    required Function onSuccess,
    required Function onError,
  }) async {
    HttpLink httpLink = HttpLink(
      url ?? base_url,
      defaultHeaders: <String, String>{"Authorization": "Bearer $accessToken"},
    );

    GraphQLClient qlClient = GraphQLClient(
      cache: GraphQLCache(
        store: HiveStore(),
      ),
      link: httpLink,
    );

    QueryResult result = await qlClient.query(
      QueryOptions(
        document: gql(
          mutation,
        ),
        fetchPolicy: FetchPolicy.noCache,
      ),
    );
    if (result.hasException) {
      onError(result.exception!.graphqlErrors[0].message);
      Console.error("Error", result.exception!.graphqlErrors[0].message);
    } else if (!result.hasException) {
      onSuccess(result.data);
    } else {
      return Future.value(null);
    }
  }
}
