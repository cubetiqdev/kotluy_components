import 'package:graphql_flutter/graphql_flutter.dart';

class GraphQlService {
  final String url;

  GraphQlService({required this.url});

//////////////////////////////////////////////////////////////////////////////////////////
  void queryDataNoAuth(String query) async {
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
  void queryDataWithAuth(
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
  void mutationDataWithNoAuth({required String mutation}) async {
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
      print(result.data);
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////
  void mutationDataWithAuth(
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