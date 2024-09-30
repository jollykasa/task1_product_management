import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task1/pages/category_page/bloc/category_bloc.dart';
import 'package:task1/pages/product_detail_page/bloc/productdetail_bloc.dart';
import 'package:task1/pages/signin_page/bloc/sign_in_page_bloc.dart';
import 'package:task1/pages/signup_page/bloc/signup_page_bloc.dart';

import '../../pages/home_page/bloc/home_page_bloc.dart';

class BlocProviderHelper {
  static List<BlocProvider> providers = [
    BlocProvider<HomePageBloc>(create: (_) => HomePageBloc()),
    BlocProvider<CategoryBloc>(create: (_) => CategoryBloc()),
    BlocProvider<ProductdetailBloc>(create: (_) => ProductdetailBloc()),
    BlocProvider<SignInPageBloc>(create: (_) => SignInPageBloc()),
    BlocProvider<SignupPageBloc>(create: (_) => SignupPageBloc()),
  ];
}
