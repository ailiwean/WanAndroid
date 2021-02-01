class BaseApi {
  final String server;
  final String url;
  final Map headers;
  final body;
  final Type type;
  final Map params;

  BaseApi.create(
      {this.url, this.headers, this.body, this.type, this.server, this.params});
}

enum Type { GET, POST }
