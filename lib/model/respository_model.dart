List<RepositoryModel> repositoryFromJson(dynamic res) {
  final data = res["items"];
  return List<RepositoryModel>.from(data.map((x) => RepositoryModel.fromJson(x)));
}

class RepositoryModelItemsLicense {


  String? key;
  String? name;
  String? spdxId;
  String? url;
  String? nodeId;

  RepositoryModelItemsLicense({
    this.key,
    this.name,
    this.spdxId,
    this.url,
    this.nodeId,
  });
  RepositoryModelItemsLicense.fromJson(Map<String, dynamic> json) {
    key = json['key']?.toString();
    name = json['name']?.toString();
    spdxId = json['spdx_id']?.toString();
    url = json['url']?.toString();
    nodeId = json['node_id']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['key'] = key;
    data['name'] = name;
    data['spdx_id'] = spdxId;
    data['url'] = url;
    data['node_id'] = nodeId;
    return data;
  }
}

class RepositoryModelItemsOwner {


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

  RepositoryModelItemsOwner({
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
  RepositoryModelItemsOwner.fromJson(Map<String, dynamic> json) {
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

class RepositoryModel {


  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  RepositoryModelItemsOwner? owner;
  String? htmlUrl;
  String? description;
  bool? fork;
  String? url;
  String? forksUrl;
  String? keysUrl;
  String? collaboratorsUrl;
  String? teamsUrl;
  String? hooksUrl;
  String? issueEventsUrl;
  String? eventsUrl;
  String? assigneesUrl;
  String? branchesUrl;
  String? tagsUrl;
  String? blobsUrl;
  String? gitTagsUrl;
  String? gitRefsUrl;
  String? treesUrl;
  String? statusesUrl;
  String? languagesUrl;
  String? stargazersUrl;
  String? contributorsUrl;
  String? subscribersUrl;
  String? subscriptionUrl;
  String? commitsUrl;
  String? gitCommitsUrl;
  String? commentsUrl;
  String? issueCommentUrl;
  String? contentsUrl;
  String? compareUrl;
  String? mergesUrl;
  String? archiveUrl;
  String? downloadsUrl;
  String? issuesUrl;
  String? pullsUrl;
  String? milestonesUrl;
  String? notificationsUrl;
  String? labelsUrl;
  String? releasesUrl;
  String? deploymentsUrl;
  String? createdAt;
  String? updatedAt;
  String? pushedAt;
  String? gitUrl;
  String? sshUrl;
  String? cloneUrl;
  String? svnUrl;
  String? homepage;
  int? size;
  int? stargazersCount;
  int? watchersCount;
  String? language;
  bool? hasIssues;
  bool? hasProjects;
  bool? hasDownloads;
  bool? hasWiki;
  bool? hasPages;
  int? forksCount;
  String? mirrorUrl;
  bool? archived;
  bool? disabled;
  int? openIssuesCount;
  RepositoryModelItemsLicense? license;
  bool? allowForking;
  bool? isTemplate;
  List<String?>? topics;
  String? visibility;
  int? forks;
  int? openIssues;
  int? watchers;
  String? defaultBranch;
  int? score;

  RepositoryModel({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.owner,
    this.htmlUrl,
    this.description,
    this.fork,
    this.url,
    this.forksUrl,
    this.keysUrl,
    this.collaboratorsUrl,
    this.teamsUrl,
    this.hooksUrl,
    this.issueEventsUrl,
    this.eventsUrl,
    this.assigneesUrl,
    this.branchesUrl,
    this.tagsUrl,
    this.blobsUrl,
    this.gitTagsUrl,
    this.gitRefsUrl,
    this.treesUrl,
    this.statusesUrl,
    this.languagesUrl,
    this.stargazersUrl,
    this.contributorsUrl,
    this.subscribersUrl,
    this.subscriptionUrl,
    this.commitsUrl,
    this.gitCommitsUrl,
    this.commentsUrl,
    this.issueCommentUrl,
    this.contentsUrl,
    this.compareUrl,
    this.mergesUrl,
    this.archiveUrl,
    this.downloadsUrl,
    this.issuesUrl,
    this.pullsUrl,
    this.milestonesUrl,
    this.notificationsUrl,
    this.labelsUrl,
    this.releasesUrl,
    this.deploymentsUrl,
    this.createdAt,
    this.updatedAt,
    this.pushedAt,
    this.gitUrl,
    this.sshUrl,
    this.cloneUrl,
    this.svnUrl,
    this.homepage,
    this.size,
    this.stargazersCount,
    this.watchersCount,
    this.language,
    this.hasIssues,
    this.hasProjects,
    this.hasDownloads,
    this.hasWiki,
    this.hasPages,
    this.forksCount,
    this.mirrorUrl,
    this.archived,
    this.disabled,
    this.openIssuesCount,
    this.license,
    this.allowForking,
    this.isTemplate,
    this.topics,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
    this.score,
  });
  RepositoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id']?.toInt();
    nodeId = json['node_id']?.toString();
    name = json['name']?.toString();
    fullName = json['full_name']?.toString();
    private = json['private'];
    owner = (json['owner'] != null) ? RepositoryModelItemsOwner.fromJson(json['owner']) : null;
    htmlUrl = json['html_url']?.toString();
    description = json['description']?.toString();
    fork = json['fork'];
    url = json['url']?.toString();
    forksUrl = json['forks_url']?.toString();
    keysUrl = json['keys_url']?.toString();
    collaboratorsUrl = json['collaborators_url']?.toString();
    teamsUrl = json['teams_url']?.toString();
    hooksUrl = json['hooks_url']?.toString();
    issueEventsUrl = json['issue_events_url']?.toString();
    eventsUrl = json['events_url']?.toString();
    assigneesUrl = json['assignees_url']?.toString();
    branchesUrl = json['branches_url']?.toString();
    tagsUrl = json['tags_url']?.toString();
    blobsUrl = json['blobs_url']?.toString();
    gitTagsUrl = json['git_tags_url']?.toString();
    gitRefsUrl = json['git_refs_url']?.toString();
    treesUrl = json['trees_url']?.toString();
    statusesUrl = json['statuses_url']?.toString();
    languagesUrl = json['languages_url']?.toString();
    stargazersUrl = json['stargazers_url']?.toString();
    contributorsUrl = json['contributors_url']?.toString();
    subscribersUrl = json['subscribers_url']?.toString();
    subscriptionUrl = json['subscription_url']?.toString();
    commitsUrl = json['commits_url']?.toString();
    gitCommitsUrl = json['git_commits_url']?.toString();
    commentsUrl = json['comments_url']?.toString();
    issueCommentUrl = json['issue_comment_url']?.toString();
    contentsUrl = json['contents_url']?.toString();
    compareUrl = json['compare_url']?.toString();
    mergesUrl = json['merges_url']?.toString();
    archiveUrl = json['archive_url']?.toString();
    downloadsUrl = json['downloads_url']?.toString();
    issuesUrl = json['issues_url']?.toString();
    pullsUrl = json['pulls_url']?.toString();
    milestonesUrl = json['milestones_url']?.toString();
    notificationsUrl = json['notifications_url']?.toString();
    labelsUrl = json['labels_url']?.toString();
    releasesUrl = json['releases_url']?.toString();
    deploymentsUrl = json['deployments_url']?.toString();
    createdAt = json['created_at']?.toString();
    updatedAt = json['updated_at']?.toString();
    pushedAt = json['pushed_at']?.toString();
    gitUrl = json['git_url']?.toString();
    sshUrl = json['ssh_url']?.toString();
    cloneUrl = json['clone_url']?.toString();
    svnUrl = json['svn_url']?.toString();
    homepage = json['homepage']?.toString();
    size = json['size']?.toInt();
    stargazersCount = json['stargazers_count']?.toInt();
    watchersCount = json['watchers_count']?.toInt();
    language = json['language']?.toString();
    hasIssues = json['has_issues'];
    hasProjects = json['has_projects'];
    hasDownloads = json['has_downloads'];
    hasWiki = json['has_wiki'];
    hasPages = json['has_pages'];
    forksCount = json['forks_count']?.toInt();
    mirrorUrl = json['mirror_url']?.toString();
    archived = json['archived'];
    disabled = json['disabled'];
    openIssuesCount = json['open_issues_count']?.toInt();
    license = (json['license'] != null) ? RepositoryModelItemsLicense.fromJson(json['license']) : null;
    allowForking = json['allow_forking'];
    isTemplate = json['is_template'];
  if (json['topics'] != null) {
  final v = json['topics'];
  final arr0 = <String>[];
  v.forEach((v) {
  arr0.add(v.toString());
  });
    topics = arr0;
    }
    visibility = json['visibility']?.toString();
    forks = json['forks']?.toInt();
    openIssues = json['open_issues']?.toInt();
    watchers = json['watchers']?.toInt();
    defaultBranch = json['default_branch']?.toString();
    score = json['score']?.toInt();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['node_id'] = nodeId;
    data['name'] = name;
    data['full_name'] = fullName;
    data['private'] = private;
    if (owner != null) {
      data['owner'] = owner!.toJson();
    }
    data['html_url'] = htmlUrl;
    data['description'] = description;
    data['fork'] = fork;
    data['url'] = url;
    data['forks_url'] = forksUrl;
    data['keys_url'] = keysUrl;
    data['collaborators_url'] = collaboratorsUrl;
    data['teams_url'] = teamsUrl;
    data['hooks_url'] = hooksUrl;
    data['issue_events_url'] = issueEventsUrl;
    data['events_url'] = eventsUrl;
    data['assignees_url'] = assigneesUrl;
    data['branches_url'] = branchesUrl;
    data['tags_url'] = tagsUrl;
    data['blobs_url'] = blobsUrl;
    data['git_tags_url'] = gitTagsUrl;
    data['git_refs_url'] = gitRefsUrl;
    data['trees_url'] = treesUrl;
    data['statuses_url'] = statusesUrl;
    data['languages_url'] = languagesUrl;
    data['stargazers_url'] = stargazersUrl;
    data['contributors_url'] = contributorsUrl;
    data['subscribers_url'] = subscribersUrl;
    data['subscription_url'] = subscriptionUrl;
    data['commits_url'] = commitsUrl;
    data['git_commits_url'] = gitCommitsUrl;
    data['comments_url'] = commentsUrl;
    data['issue_comment_url'] = issueCommentUrl;
    data['contents_url'] = contentsUrl;
    data['compare_url'] = compareUrl;
    data['merges_url'] = mergesUrl;
    data['archive_url'] = archiveUrl;
    data['downloads_url'] = downloadsUrl;
    data['issues_url'] = issuesUrl;
    data['pulls_url'] = pullsUrl;
    data['milestones_url'] = milestonesUrl;
    data['notifications_url'] = notificationsUrl;
    data['labels_url'] = labelsUrl;
    data['releases_url'] = releasesUrl;
    data['deployments_url'] = deploymentsUrl;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['pushed_at'] = pushedAt;
    data['git_url'] = gitUrl;
    data['ssh_url'] = sshUrl;
    data['clone_url'] = cloneUrl;
    data['svn_url'] = svnUrl;
    data['homepage'] = homepage;
    data['size'] = size;
    data['stargazers_count'] = stargazersCount;
    data['watchers_count'] = watchersCount;
    data['language'] = language;
    data['has_issues'] = hasIssues;
    data['has_projects'] = hasProjects;
    data['has_downloads'] = hasDownloads;
    data['has_wiki'] = hasWiki;
    data['has_pages'] = hasPages;
    data['forks_count'] = forksCount;
    data['mirror_url'] = mirrorUrl;
    data['archived'] = archived;
    data['disabled'] = disabled;
    data['open_issues_count'] = openIssuesCount;
    if (license != null) {
      data['license'] = license!.toJson();
    }
    data['allow_forking'] = allowForking;
    data['is_template'] = isTemplate;
    if (topics != null) {
      final v = topics;
      final arr0 = [];
  for (var v in v!) {
  arr0.add(v);
  }
      data['topics'] = arr0;
    }
    data['visibility'] = visibility;
    data['forks'] = forks;
    data['open_issues'] = openIssues;
    data['watchers'] = watchers;
    data['default_branch'] = defaultBranch;
    data['score'] = score;
    return data;
  }
}
