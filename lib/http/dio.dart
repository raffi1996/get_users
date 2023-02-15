import 'package:dio/dio.dart';

final options = BaseOptions(
    baseUrl: 'https://random-data-api.com/',
    connectTimeout: const Duration(milliseconds: 240000),
    receiveTimeout: const Duration(milliseconds: 240000),
);

final dio = Dio(options);
