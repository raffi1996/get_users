import 'dart:developer';

import 'package:dio/dio.dart';


final options = BaseOptions(
  baseUrl: 'https://random-data-api.com/',
  connectTimeout: 240000,
  receiveTimeout: 240000,
);

final dio = Dio(options)..interceptors.addAll(
  <Interceptor>[
    LogInterceptor(
      requestBody: true,
      responseBody: true,
      logPrint: (res) {
        log(res.toString(), name: 'BE');
      },
    ),
  ],
);

CancelToken cancelToken = CancelToken();
