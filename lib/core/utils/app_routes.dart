import 'package:darsak/Feature/auth/presentation/views/auth_view.dart';
import 'package:darsak/Feature/auth/presentation/views/student_data_cont_view.dart';
import 'package:darsak/Feature/auth/presentation/views/student_data_view.dart';
import 'package:darsak/Feature/home/presentation/views/home_layout.dart';
import 'package:darsak/Feature/home/presentation/views/subscribe_material_screen.dart';
import 'package:darsak/Feature/splash/presentation/views/splash_view.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeLayout = '/homeLayout';
  static const kAuthView = '/authView';
  static const kStudentDataView = '/studentDataView';
  static const kStudentDataContView = '/studentDataContView';
  static const kSubscribtionToSubject = '/subscribtionToSubject';

  static final router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),

      GoRoute(
        path: kHomeLayout,
        builder: (context, state) => const HomeLayout(),
      ),
      GoRoute(path: kAuthView, builder: (context, state) => const AuthView()),
      GoRoute(
        path: kStudentDataView,
        builder: (context, state) => const StudentDataView(),
      ),
      GoRoute(
        path: kStudentDataContView,
        builder: (context, state) => const StudentDataContactView(),
      ),
      GoRoute(
        path: kSubscribtionToSubject,
        builder: (context, state) => const SubscribeMaterialScreen(),
      ),
    ],
  );
}
