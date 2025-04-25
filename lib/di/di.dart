// lib/di.dart
import 'package:get_it/get_it.dart';
import 'package:hotel_booking/http/http.dart';
import 'package:hotel_booking/http/http_client_interface.dart';
import 'package:hotel_booking/presentation/blocs/auth/register/register_bloc.dart';
import 'package:hotel_booking/service/auth_service.dart';
import 'package:hotel_booking/service/token_manager.dart';

import '../core/utils/toast_manager.dart';
import '../core/utils/toast_provider.dart';
import '../service/token_service_interface.dart';


final getIt = GetIt.instance;

void setup() {
  // Register TokenService first (no dependency on HttpClient at initialization)
  getIt.registerSingleton<TokenServiceInterface>(TokenService(null as dynamic));

  // Register HttpClient with TokenService
  getIt.registerSingleton<HttpClientInterface>(
    HttpClient(getIt<TokenServiceInterface>()),
  );

  // Update TokenService with HttpClient
  (getIt<TokenServiceInterface>() as TokenService).setHttpClient(getIt<HttpClientInterface>());

  // Register AuthService
  getIt.registerSingleton<AuthService>(
    AuthService(
      getIt<HttpClientInterface>(),
      getIt<TokenServiceInterface>(),
    ),
  );

  // Register ToastProvider
  getIt.registerSingleton<ToastProvider>(ToastManager());

  // Register Blocs
  getIt.registerFactory<RegisterBloc>(
        () => RegisterBloc(
      getIt<AuthService>(),
      getIt<ToastProvider>(),
    ),
  );
}