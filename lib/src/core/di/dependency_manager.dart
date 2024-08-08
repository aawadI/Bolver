import 'package:get_it/get_it.dart';

import '../../repository/repository.dart';
// import 'package:google_place/google_place.dart';

import '../handlers/handlers.dart';
import '../routes/app_router.gr.dart';

final GetIt getIt = GetIt.instance;

void setUpDependencies() {
  getIt.registerSingleton<AppRouter>(AppRouter());
  getIt.registerLazySingleton<HttpService>(() => HttpService());
  getIt.registerSingleton<UserRepository>(UserRepositoryImpl());
  getIt.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  getIt.registerSingleton<ShopsRepository>(ShopsRepositoryImpl());
  getIt.registerSingleton<BlogsRepository>(BlogsRepositoryImpl());
  getIt.registerSingleton<OrdersRepository>(OrdersRepositoryImpl());
  getIt.registerSingleton<BrandsRepository>(BrandsRepositoryImpl());
  getIt.registerSingleton<GalleryRepository>(GalleryRepositoryImpl());
  getIt.registerSingleton<AddressRepository>(AddressRepositoryImpl());
  getIt.registerSingleton<BannersRepository>(BannersRepositoryImpl());
  getIt.registerSingleton<ProductsRepository>(ProductsRepositoryImpl());
  getIt.registerSingleton<PaymentsRepository>(PaymentsRepositoryImpl());
  getIt.registerSingleton<CategoriesRepository>(CategoriesRepositoryImpl());
  getIt.registerSingleton<CurrenciesRepository>(CurrenciesRepositoryImpl());
  // getIt.registerSingleton<GooglePlace>(GooglePlace(AppConstants.googleApiKey));
  getIt.registerSingleton<SettingsRepository>(SettingsSettingsRepositoryImpl());
}

final appRouter = getIt.get<AppRouter>();
// final googlePlace = getIt.get<GooglePlace>();
final authRepository = getIt.get<AuthRepository>();
final userRepository = getIt.get<UserRepository>();
final blogsRepository = getIt.get<BlogsRepository>();
final shopsRepository = getIt.get<ShopsRepository>();
final brandsRepository = getIt.get<BrandsRepository>();
final ordersRepository = getIt.get<OrdersRepository>();
final galleryRepository = getIt.get<GalleryRepository>();
final bannersRepository = getIt.get<BannersRepository>();
final settingsRepository = getIt.get<SettingsRepository>();
final productsRepository = getIt.get<ProductsRepository>();
final addressesRepository = getIt.get<AddressRepository>();
final paymentsRepository = getIt.get<PaymentsRepository>();
final categoriesRepository = getIt.get<CategoriesRepository>();
final currenciesRepository = getIt.get<CurrenciesRepository>();
