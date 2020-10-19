class Data {
  final int index;
  final String avatar_url;
  final String url;
  final String repos_url;
  // final String balance;

  Data({this.index, this.avatar_url, this.url, this.repos_url});
  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      index: json['index'],
      avatar_url: json['avatar_url'],
      url: json['url'],
      repos_url: json['repos_url'],
      // balance: json['balance'],
    );
  }
}
