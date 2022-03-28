import 'dart:convert';
import 'package:http/http.dart';
import 'package:http_interceptor/http_interceptor.dart';

import '../models/contact.dart';
import '../models/transaction.dart';
import 'interceptors/logging_interceptor.dart';



Client client = InterceptedClient.build(interceptors: [LoggingInterceptor()]);
const baseUrl = 'http://192.168.0.105:8080/transactions';


