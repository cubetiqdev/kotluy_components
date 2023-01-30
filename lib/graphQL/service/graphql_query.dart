// ignore_for_file: unnecessary_string_interpolations, avoid_print

import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQLQuery {
  final String url;

  GraphQLQuery({required this.url});

//////////////////////////////////////////////////////////////////////////////////////////
  Future<dynamic> queryDataNoAuth(String query) async {
    HttpLink httpLink = HttpLink(
      url,
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
          """$query""",
        ),
      ),
    );
    if (result.hasException) {
      print(result.exception);
    } else if (result.isLoading) {
      return;
    } else if (!result.hasException) {
      print(result.data);
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  Future<dynamic> queryDataWithAuth(
      {required String query, required String accessToken}) async {
    HttpLink httpLink = HttpLink(
      url,
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
          """$query""",
        ),
      ),
    );
    if (result.hasException) {
      print(result.exception);
    } else if (result.isLoading) {
      return Future.value(null);
    } else if (!result.hasException) {
      print(result.data);
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  Future<dynamic> mutationDataWithNoAuth({required String mutation}) async {
    HttpLink httpLink = HttpLink(
      url,
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
          """$mutation""",
        ),
      ),
    );
    if (result.hasException) {
      return result.exception;
    } else if (result.isLoading) {
      return Future.value(null);
    } else if (!result.hasException) {
      return result.data;
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  Future<dynamic> mutationDataWithAuth(
      {required String mutation, required String accessToken}) async {
    HttpLink httpLink = HttpLink(
      url,
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
          """$mutation""",
        ),
      ),
    );
    if (result.hasException) {
      print(result.exception);
    } else if (result.isLoading) {
      return Future.value(null);
    } else if (!result.hasException) {
      print(result.data);
    }
  }
}
