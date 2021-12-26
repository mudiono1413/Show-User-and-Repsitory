List<IssueModel> issueFromJson(dynamic res) {
  final data = res["items"];
  return List<IssueModel>.from(data.map((x) => IssueModel.fromJson(x)));
}


class IssueModelItemsReactions {
  String? url;
  int? totalCount;
  int? laugh;
  int? hooray;
  int? confused;
  int? heart;
  int? rocket;
  int? eyes;

  IssueModelItemsReactions({
    this.url,
    this.totalCount,
    this.laugh,
    this.hooray,
    this.confused,
    this.heart,
    this.rocket,
    this.eyes,
  });
  IssueModelItemsReactions.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
    totalCount = json['total_count']?.toInt();

    laugh = json['laugh']?.toInt();
    hooray = json['hooray']?.toInt();
    confused = json['confused']?.toInt();
    heart = json['heart']?.toInt();
    rocket = json['rocket']?.toInt();
    eyes = json['eyes']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['total_count'] = totalCount;

    data['laugh'] = laugh;
    data['hooray'] = hooray;
    data['confused'] = confused;
    data['heart'] = heart;
    data['rocket'] = rocket;
    data['eyes'] = eyes;
    return data;
  }
}

class IssueModelItemsUser {
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

  IssueModelItemsUser({
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
  });
  IssueModelItemsUser.fromJson(Map<String, dynamic> json) {
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
    return data;
  }
}

class IssueModel {
  String? url;
  String? repositoryUrl;
  String? labelsUrl;
  String? commentsUrl;
  String? eventsUrl;
  String? htmlUrl;
  int? id;
  String? nodeId;
  int? number;
  String? title;
  IssueModelItemsUser? user;
  String? state;
  bool? locked;
  String? assignee;
  String? milestone;
  int? comments;
  String? createdAt;
  String? updatedAt;
  String? closedAt;
  String? authorAssociation;
  String? activeLockReason;
  String? body;
  IssueModelItemsReactions? reactions;
  String? timelineUrl;
  String? performedViaGithubApp;
  int? score;

  IssueModel({
    this.url,
    this.repositoryUrl,
    this.labelsUrl,
    this.commentsUrl,
    this.eventsUrl,
    this.htmlUrl,
    this.id,
    this.nodeId,
    this.number,
    this.title,
    this.user,
    this.state,
    this.locked,
    this.assignee,
    this.milestone,
    this.comments,
    this.createdAt,
    this.updatedAt,
    this.closedAt,
    this.authorAssociation,
    this.activeLockReason,
    this.body,
    this.reactions,
    this.timelineUrl,
    this.performedViaGithubApp,
    this.score,
  });
  IssueModel.fromJson(Map<String, dynamic> json) {
    url = json['url']?.toString();
    repositoryUrl = json['repository_url']?.toString();
    labelsUrl = json['labels_url']?.toString();
    commentsUrl = json['comments_url']?.toString();
    eventsUrl = json['events_url']?.toString();
    htmlUrl = json['html_url']?.toString();
    id = json['id']?.toInt();
    nodeId = json['node_id']?.toString();
    number = json['number']?.toInt();
    title = json['title']?.toString();
    user = (json['user'] != null)
        ? IssueModelItemsUser.fromJson(json['user'])
        : null;

    state = json['state']?.toString();
    locked = json['locked'];
    assignee = json['assignee']?.toString();

    milestone = json['milestone']?.toString();
    comments = json['comments']?.toInt();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    closedAt = json['closed_at']?.toString();
    authorAssociation = json['author_association']?.toString();
    activeLockReason = json['active_lock_reason']?.toString();
    body = json['body']?.toString();
    reactions = (json['reactions'] != null)
        ? IssueModelItemsReactions.fromJson(json['reactions'])
        : null;
    timelineUrl = json['timeline_url']?.toString();
    performedViaGithubApp = json['performed_via_github_app']?.toString();
    score = json['score']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['url'] = url;
    data['repository_url'] = repositoryUrl;
    data['labels_url'] = labelsUrl;
    data['comments_url'] = commentsUrl;
    data['events_url'] = eventsUrl;
    data['html_url'] = htmlUrl;
    data['id'] = id;
    data['node_id'] = nodeId;
    data['number'] = number;
    data['title'] = title;
    if (user != null) {
      data['user'] = user!.toJson();
    }

    data['state'] = state;
    data['locked'] = locked;
    data['assignee'] = assignee;

    data['milestone'] = milestone;
    data['comments'] = comments;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['closed_at'] = closedAt;
    data['author_association'] = authorAssociation;
    data['active_lock_reason'] = activeLockReason;
    data['body'] = body;
    if (reactions != null) {
      data['reactions'] = reactions!.toJson();
    }
    data['timeline_url'] = timelineUrl;
    data['performed_via_github_app'] = performedViaGithubApp;
    data['score'] = score;
    return data;
  }
}
