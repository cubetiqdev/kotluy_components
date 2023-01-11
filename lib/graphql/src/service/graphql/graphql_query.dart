// class GraphQL{
//   final String? baseUrl;

//   GraphQL({required this.baseUrl});

//   Future<dynamic> query({String? query}){
//      HttpLink link = HttpLink(url, defaultHeaders: Headers);
//     GraphQLClient qlClient = GraphQLClient(
//       link: link,
//       cache: GraphQLCache(
//         store: HiveStore(),
//       ),
//     );

//     QueryResult queryResult = await qlClient.query(
//       QueryOptions(
//         document: gql("""${query}"""),
//         onError: (error) {
//           Console.log('Error', error);
//         },
//         onComplete: (data) {
//           Console.log("complete", data);
//         },
//       ),
//     );
//   }

// }