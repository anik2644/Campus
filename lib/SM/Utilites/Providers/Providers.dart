import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../Auth/Login/login_view_model.dart';
import '../Auth/Register/RegisterViewModel.dart';

List<SingleChildWidget> providers = [
  ChangeNotifierProvider(create: (_) => RegisterViewModel()),
  ChangeNotifierProvider(create: (_) => LoginViewModel()),
 // ChangeNotifierProvider(create: (_) => PostsViewModel()),
/*  ChangeNotifierProvider(create: (_) => EditProfileViewModel()),
  ChangeNotifierProvider(create: (_) => ConversationViewModel()),
  ChangeNotifierProvider(create: (_) => StatusViewModel()),
  ChangeNotifierProvider(create: (_) => UserViewModel()),
  ChangeNotifierProvider(create: (_) => ThemeProvider()),*/
];
