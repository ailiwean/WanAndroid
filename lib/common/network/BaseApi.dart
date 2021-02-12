class BaseApi {
  final String server;
  final String url;
  final Map headers;
  final body;
  final Type type;
  final Map params;
  final bool isFrom;

  BaseApi.create(
      {this.url,
      this.headers,
      this.body,
      this.type,
      this.server,
      this.params,
      this.isFrom});
}

enum Type { GET, POST }
