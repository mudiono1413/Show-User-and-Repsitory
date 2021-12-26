import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:user_github_cubit/bloc/issue_cubit.dart';
import 'package:user_github_cubit/bloc/repository_cubit.dart';
import 'package:user_github_cubit/bloc/user_cubit.dart';
import 'package:user_github_cubit/widget/card/card_category.dart';
import 'package:user_github_cubit/widget/card/card_choice_paging.dart';
import 'package:user_github_cubit/widget/card/card_issuse.dart';
import 'package:user_github_cubit/widget/card/card_repository.dart';
import 'package:user_github_cubit/widget/card/card_usert.dart';
import 'package:user_github_cubit/widget/pagging_bottom.dart';

class HomePage extends StatefulWidget {
  final int category;
  const HomePage({Key? key, required this.category}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

bool withIndex = false;
int category = 0;

class _HomePageState extends State<HomePage> {
  List<String> dataChoice = ['Lazy Loading', 'With Index'];
  List<String> categpryChoice = ['Usser', 'Issue', 'Repository'];

  TextEditingController keyTxtController = TextEditingController();

  var top = 10.0;
  int selectedIndex = 0;
  int selectedCategoryIndex = 0;
  late ScrollController _scrollController;

  bool get _isAppBarExpanded {
    return _scrollController.hasClients &&
        _scrollController.offset > (260 - kToolbarHeight);
  }

  bool isLoading = false;
  final scrollController = ScrollController();

  void setupScrollController(context) {
    scrollController.addListener(() {
      if (scrollController.position.atEdge) {
        if (scrollController.position.pixels != 0) {
          isLoading = true;
          if (category == 0) {
            BlocProvider.of<UserCubit>(context).loadUser();
          } else if (category == 1) {
            BlocProvider.of<IssueCubit>(context).loadIssue();
          } else if (category == 2) {
            BlocProvider.of<RepositoryCubit>(context).loadRepository();
          }
        }
      }
    });
  }

  @override
  void initState() {
    selectedCategoryIndex = widget.category;
    category = widget.category;
    setupScrollController(context);
    // if (category == 0) {
    //   if (withIndex) {
    //     BlocProvider.of<UserCubit>(context).loadAllUser();
    //   } else {
    //     BlocProvider.of<UserCubit>(context).loadUser();
    //   }
    // } else if (category == 1) {
    //   if (withIndex) {
    //     BlocProvider.of<IssueCubit>(context).loadAllIssue;
    //   } else {
    //     BlocProvider.of<IssueCubit>(context).loadIssue();
    //   }
    // } else if (category == 2) {
    //   if (withIndex) {
    //     BlocProvider.of<RepositoryCubit>(context).loadAllRepository();
    //   } else {
    //     BlocProvider.of<RepositoryCubit>(context).loadRepository();
    //   }
    // }

    getDatabyCategory(widget.category, false);

    _scrollController = ScrollController()
      ..addListener(() {
        if (_isAppBarExpanded) {
          setState(() {
            top = 60.0;
          });
        } else {
          setState(() {
            top = 10;
          });
        }
      });

    super.initState();
  }

  void getDatabyCategory(int category, bool withIndex) {
    BlocProvider.of<UserCubit>(context).changeStatus();

    BlocProvider.of<IssueCubit>(context).changeStatus();
    BlocProvider.of<RepositoryCubit>(context).changeStatus();
    if (category == 0) {
      if (withIndex) {
        BlocProvider.of<UserCubit>(context).loadAllUser();
      } else {
        BlocProvider.of<UserCubit>(context).loadUser();
      }
    } else if (category == 1) {
      if (withIndex) {
        BlocProvider.of<IssueCubit>(context).loadAllIssue();
      } else {

        BlocProvider.of<IssueCubit>(context).loadIssue();
      }
    } else if (category == 2) {
      if (withIndex) {
        BlocProvider.of<RepositoryCubit>(context).loadAllRepository();
      } else {
        BlocProvider.of<RepositoryCubit>(context).loadRepository();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: category == 0
            ? _bottomNavPaggingUser()
            : category == 1
                ? _bottomNavPaggingIssue()
                : _bottomNavPaggingRepository(),
        body: SafeArea(
          child: NestedScrollView(
              controller: _scrollController,
              headerSliverBuilder:
                  (BuildContext context, bool innerBoxIsScrolled) {
                return <Widget>[
                  SliverAppBar(
                    expandedHeight: 65.5,
                    backgroundColor: Colors.white,
                    floating: false,
                    pinned: false,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.blue[100]!,
                                blurRadius: 5,
                                offset: const Offset(1, 1),
                              ),
                            ],
                          ),
                          child: TextFormField(
                            controller: keyTxtController,
                            textCapitalization: TextCapitalization.characters,
                            validator: (value) {},
                            onFieldSubmitted: (String value) {
                              if (category == 0) {
                                BlocProvider.of<UserCubit>(context)
                                    .changeStatus();
                                if (withIndex) {
                                  BlocProvider.of<UserCubit>(context)
                                      .loadAllUser(key: value);
                                } else {
                                  BlocProvider.of<UserCubit>(context)
                                      .loadUser(key: value);
                                }
                              } else if (category == 1) {
                                BlocProvider.of<IssueCubit>(context)
                                    .changeStatus();
                                if (withIndex) {
                                  BlocProvider.of<IssueCubit>(context)
                                      .loadAllIssue(key: value);
                                } else {
                                  BlocProvider.of<IssueCubit>(context)
                                      .loadIssue(key: value);
                                }
                              } else if (category == 2) {
                                BlocProvider.of<RepositoryCubit>(context)
                                    .changeStatus();
                                if (withIndex) {
                                  BlocProvider.of<RepositoryCubit>(context)
                                      .loadAllRepository(key: value);
                                } else {
                                  BlocProvider.of<RepositoryCubit>(context)
                                      .loadRepository(key: value);
                                }
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Icon(
                                Icons.search,
                                size: 25.h,
                                color: Colors.grey,
                              ),
                              hintText: "Cari",
                              hintStyle: TextStyle(
                                  color: Colors.grey[300],
                                  fontSize: 18.sp,
                                  fontFamily: "Nunito"),
                            ),
                            style: const TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: DynamicSliverHeaderDelegate(
                      maxHeight: 80.h,
                      minHeight: 80.h,
                      child: Container(
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Expanded(
                                child: ListView.builder(
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.horizontal,
                                    itemCount: categpryChoice.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return Padding(
                                        padding: EdgeInsets.only(right: 14.0.w),
                                        child: CardCategory(
                                          text: categpryChoice[index],
                                          index: index,
                                          selectedIndex: selectedCategoryIndex,
                                          onClick: (int index) {
                                            setState(() {
                                              withIndex = false;
                                              keyTxtController.clear();
                                              selectedIndex = 0;

                                              selectedCategoryIndex = index;
                                              category = index;
                                              getDatabyCategory(index, false);
                                            });
                                          },
                                        ),
                                      );
                                    }),
                              ),
                              SizedBox(
                                height: 4.h,
                              ),
                              Expanded(
                                child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: dataChoice.length,
                                    itemBuilder: (BuildContext context, index) {
                                      return CardChoicePaging(
                                          text: dataChoice[index],
                                          index: index,
                                          selectedIndex: selectedIndex,
                                          onClick: (int index) {
                                            keyTxtController.clear();
                                            setState(() {
                                              if (index == 0) {
                                                withIndex = false;
                                                getDatabyCategory(
                                                    category, false);
                                              } else {
                                                withIndex = true;
                                                getDatabyCategory(
                                                    category, true);
                                              }
                                              selectedCategoryIndex =
                                                  selectedCategoryIndex;
                                              selectedIndex = index;
                                            });
                                          });
                                    }),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    pinned: true,
                  )
                ];
              },
              body: category == 0
                  ? _userList()
                  : category == 1
                      ? _issueList()
                      : _repositoryList()),
        ));
  }

  Widget _repositoryList() {
    return BlocBuilder<RepositoryCubit, RepositoryState>(
        builder: (context, state) {
      if (state.status == RepositoryStatus.initial) {
        return _loadingIndicator();
      }
      return withIndex
          ? ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return CardRepository(
                    repository: state.paggingRepositories[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: state.paggingRepositories.length)
          : ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) {
                if (index < state.repositories.length) {
                  return CardRepository(repository: state.repositories[index]);
                } else {
                  Timer(const Duration(milliseconds: 30), () {
                    scrollController
                        .jumpTo(scrollController.position.maxScrollExtent);
                  });

                  return _loadingIndicator();
                }
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: state.repositories.length + (isLoading ? 1 : 0),
            );
    });
  }

  Widget _issueList() {
    return BlocBuilder<IssueCubit, IssueState>(builder: (context, state) {
      if (state.status == IssueStatus.initial) {
        return _loadingIndicator();
      }
      return withIndex
          ? ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return CardIssue(issue: state.paggingIssues[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: state.paggingIssues.length)
          : ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) {
                if (index < state.issues.length) {
                  return CardIssue(issue: state.issues[index]);
                } else {
                  Timer(const Duration(milliseconds: 30), () {
                    scrollController
                        .jumpTo(scrollController.position.maxScrollExtent);
                  });

                  return _loadingIndicator();
                }
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: state.issues.length + (isLoading ? 1 : 0),
            );
    });
  }

  Widget _userList() {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state.status == UserStatus.initial) {
        return _loadingIndicator();
      }
      return withIndex
          ? ListView.separated(
              itemBuilder: (BuildContext context, index) {
                return CardUser(user: state.paggingUsers[index]);
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: state.paggingUsers.length)
          : ListView.separated(
              controller: scrollController,
              itemBuilder: (context, index) {
                if (index < state.users.length) {
                  return CardUser(user: state.users[index]);
                } else {
                  Timer(const Duration(milliseconds: 30), () {
                    scrollController
                        .jumpTo(scrollController.position.maxScrollExtent);
                  });

                  return _loadingIndicator();
                }
              },
              separatorBuilder: (context, index) {
                return Divider(
                  color: Colors.grey[400],
                );
              },
              itemCount: state.users.length + (isLoading ? 1 : 0),
            );
    });
  }

  Widget _loadingIndicator() {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Center(child: CircularProgressIndicator()),
    );
  }

  Widget _bottomNavPaggingIssue() {
    return BlocBuilder<IssueCubit, IssueState>(builder: (context, state) {
      if (state.status == IssueStatus.initial) {
        return _loadingIndicator();
      }
      return withIndex
          ? SizedBox(
              height: 24.h,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Page : ",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return PaggingBottom(
                              numb: index + 1,
                              onClick: (int page) {
                                BlocProvider.of<IssueCubit>(context)
                                    .loadAllIssue(page: index);
                              });
                        },
                        itemCount: state.pageCount),
                  ],
                ),
              ),
            )
          : Container(
              height: 0,
            );
    });
  }

  Widget _bottomNavPaggingUser() {
    return BlocBuilder<UserCubit, UserState>(builder: (context, state) {
      if (state.status == UserStatus.initial) {
        return _loadingIndicator();
      }
      return withIndex
          ? SizedBox(
              height: 24.h,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Page : ",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return PaggingBottom(
                              numb: index + 1,
                              onClick: (int page) {
                                BlocProvider.of<UserCubit>(context)
                                    .loadAllUser(page: index);
                              });
                        },
                        itemCount: state.pageCount),
                  ],
                ),
              ),
            )
          : Container(
              height: 0,
            );
    });
  }

  Widget _bottomNavPaggingRepository() {
    return BlocBuilder<RepositoryCubit, RepositoryState>(
        builder: (context, state) {
      if (state.status == RepositoryStatus.initial) {
        return _loadingIndicator();
      }
      return withIndex
          ? SizedBox(
              height: 24.h,
              child: Padding(
                padding: EdgeInsets.only(left: 8.0.w, right: 8.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Page : ",
                      style: TextStyle(
                          fontSize: 24.sp, fontWeight: FontWeight.bold),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (BuildContext context, index) {
                          return PaggingBottom(
                              numb: index + 1,
                              onClick: (int page) {
                                BlocProvider.of<RepositoryCubit>(context)
                                    .loadAllRepository(page: index);
                              });
                        },
                        itemCount: state.pageCount),
                  ],
                ),
              ),
            )
          : Container(
              height: 0,
            );
    });
  }
}

class DynamicSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final Widget child;
  final double maxHeight;
  final double minHeight;

  const DynamicSliverHeaderDelegate({
    required this.child,
    this.maxHeight = 250,
    this.minHeight = 80,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  // @override
  // bool shouldRebuild(DynamicSliverHeaderDelegate oldDelegate) => true;

  @override
  bool shouldRebuild(DynamicSliverHeaderDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;
}
