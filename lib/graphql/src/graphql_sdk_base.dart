// class GraphQL {
//   static String? _apiKey;
//   static String? _baseUrl;
//   static initialize({String? url, String? apiKey}) {
//     _apiKey = apiKey;
//     _baseUrl = url;
//   }

//   static Map<String, String> _getHeaders() {
//     return {
//       'Authorization': 'Api-Key $_apiKey',
//       'Content-Type': 'application/json'
//     };
//   }

//       var response = await GraphQLService.query(query,
//         url: _baseUrl, headers: _getHeaders());
//     if (response != null) {
//       return CollectorResponse.fromGraphQLResult(response);
//     }
// }
