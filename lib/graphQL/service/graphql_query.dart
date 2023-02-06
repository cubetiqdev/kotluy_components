// ignore_for_file: unnecessary_string_interpolations

import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService {
  final String url;

  GraphQlService({required this.url});

//////////////////////////////////////////////////////////////////////////////////////////
  void queryDataNoAuth(
      {required String query, required Function reponseData}) async {
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
      reponseData(result.data);
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
  void queryDataWithAuth(
      {required String query,
      required String accessToken,
      required Function reponseData}) async {
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
      reponseData(result.data);
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  void mutationDataWithNoAuth(
      {required String mutation, required Function reponseData}) async {
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
      print(result.exception);
    } else if (result.isLoading) {
      return Future.value(null);
    } else if (!result.hasException) {
      reponseData(result.data); 
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  void mutationDataWithAuth(
      {required String mutation,
      required String accessToken,
      required Function reponseData}) async {
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
      reponseData(result.data);
    }
  }
}
