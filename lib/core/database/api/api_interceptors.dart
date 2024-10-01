import 'package:chef_app/core/database/api/api_endPoints.dart';
import 'package:chef_app/core/database/cache/cache_helper.dart';
import 'package:chef_app/core/services/service_locator.dart';
import 'package:dio/dio.dart';

class ApiInterceptors  extends Interceptor{

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
      options.headers[ApiKeys.token]=
      sl<CacheHelper>().getData(key: ApiKeys.token)
          !=null?'FOODAPI ${sl<CacheHelper>().getData(key: ApiKeys.token)}':null;
    super.onRequest(options, handler);
  }


}
