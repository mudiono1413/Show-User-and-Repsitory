List<UserModel> userFromJson(dynamic res) {
  final data = res["items"];
  return List<UserModel>.from(data.map((x) => UserModel.fromJson(x)));
}

class UserModel {
  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? gistsUrl;
  String? starredUrl;
  String? subscriptionsUrl;
  String? organizationsUrl;
  String? reposUrl;
  String? eventsUrl;
  String? receivedEventsUrl;
  String? type;
  bool? siteAdmin;
  int? score;

  UserModel({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.gistsUrl,
    this.starredUrl,
    this.subscriptionsUrl,
    this.organizationsUrl,
    this.reposUrl,
    this.eventsUrl,
    this.receivedEventsUrl,
    this.type,
    this.siteAdmin,
    this.score,
  });
  UserModel.fromJson(Map<String, dynamic> json) {
    login = json['login']?.toString();
    id = json['id']?.toInt();
    nodeId = json['node_id']?.toString();
    avatarUrl = json['avatar_url']?.toString();
    gravatarId = json['gravatar_id']?.toString();
    url = json['url']?.toString();
    htmlUrl = json['html_url']?.toString();
    followersUrl = json['followers_url']?.toString();
    followingUrl = json['following_url']?.toString();
    gistsUrl = json['gists_url']?.toString();
    starredUrl = json['starred_url']?.toString();
    subscriptionsUrl = json['subscriptions_url']?.toString();
    organizationsUrl = json['organizations_url']?.toString();
    reposUrl = json['repos_url']?.toString();
    eventsUrl = json['events_url']?.toString();
    receivedEventsUrl = json['received_events_url']?.toString();
    type = json['type']?.toString();
    siteAdmin = json['site_admin'];
    score = json['score']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['login'] = login;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['avatar_url'] = avatarUrl;
    data['gravatar_id'] = gravatarId;
    data['url'] = url;
    data['html_url'] = htmlUrl;
    data['followers_url'] = followersUrl;
    data['following_url'] = followingUrl;
    data['gists_url'] = gistsUrl;
    data['starred_url'] = starredUrl;
    data['subscriptions_url'] = subscriptionsUrl;
    data['organizations_url'] = organizationsUrl;
    data['repos_url'] = reposUrl;
    data['events_url'] = eventsUrl;
    data['received_events_url'] = receivedEventsUrl;
    data['type'] = type;
    data['site_admin'] = siteAdmin;
    data['score'] = score;
    return data;
  }
}
