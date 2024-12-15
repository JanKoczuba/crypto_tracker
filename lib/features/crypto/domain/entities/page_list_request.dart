import 'package:crypto_tracker/core/app/constants.dart';

class PageListRequest {
  PageListRequest({
    required this.page,
    required this.pageSize,
  });

  factory PageListRequest.empty() {
    return PageListRequest(
      page: 0,
      pageSize: Constants.pageSize,
    );
  }

  PageListRequest increment() {
    return PageListRequest(
      page: page + Constants.page,
      pageSize: pageSize + Constants.pageSize,
    );
  }


  final int page;
  final int pageSize;
}
