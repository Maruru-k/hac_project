import 'package:dio/dio.dart';
import 'package:hac_project/constants.dart';

final dio = Dio(); // With default `Options`.

Dio getBaseApi() {
  // Set default configs
  dio.options.baseUrl = baseUrl;
  dio.options.connectTimeout = const Duration(seconds: 10);
  dio.options.receiveTimeout = const Duration(seconds: 5);

  // Or create `Dio` with a `BaseOptions` instance.
  final options = BaseOptions(
    baseUrl: baseUrl,
    connectTimeout: const Duration(seconds: 10),
    receiveTimeout: const Duration(seconds: 5),
  );
  final anotherDio = Dio(options);

  return anotherDio;
}
