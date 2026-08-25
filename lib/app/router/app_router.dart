import 'package:geti_app/features/application/presentation/view/application_view.dart';
import 'package:geti_app/features/application/presentation/view/application_detail_view.dart';
import 'package:geti_app/features/auth/presentation/view/login_view.dart';
import 'package:geti_app/features/auth/presentation/view/oauth_webview_page.dart';
import 'package:geti_app/features/auth/presentation/view/profile_completion_guide_view.dart';
import 'package:geti_app/features/auth/presentation/view/relogin_prompt_view.dart';
import 'package:geti_app/features/company/presentation/view/company_detail_view.dart';
import 'package:geti_app/features/company/presentation/view/company_view.dart';
import 'package:geti_app/features/job/presentation/view/job_bookmark_view.dart';
import 'package:geti_app/features/job/presentation/view/job_detail_view.dart';
import 'package:geti_app/features/job/presentation/view/job_view.dart';
import 'package:geti_app/features/mypage/presentation/view/mypage_view.dart';
import 'package:geti_app/features/notification/presentation/view/notification_view.dart';
import 'package:geti_app/features/recommendation/presentation/view/recommendation_view.dart';
import 'package:geti_app/features/program/presentation/view/program_view.dart';
import 'package:geti_app/features/program/presentation/view/program_detail_view.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    initialLocation: '/login',
    routes: [
      GoRoute(
        path: '/',
        name: 'recommendation',
        builder: (context, state) => const RecommendationView(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginView(),
        routes: [
          GoRoute(
            path: 'profile-guide',
            name: 'login-profile-guide',
            builder: (context, state) => const ProfileCompletionGuideView(),
          ),
          GoRoute(
            path: 'oauth',
            name: 'login-oauth',
            builder: (context, state) =>
                OAuthWebViewPage(authorizationUrl: state.extra! as String),
          ),
        ],
      ),
      GoRoute(
        path: '/relogin',
        name: 'relogin',
        builder: (context, state) => const ReloginPromptView(),
      ),
      GoRoute(
        path: '/jobs',
        name: 'jobs',
        builder: (context, state) => const JobView(),
        routes: [
          GoRoute(
            path: 'bookmarks',
            name: 'job-bookmarks',
            builder: (context, state) => const JobBookmarkView(),
          ),
          GoRoute(
            path: ':jobId',
            name: 'job-detail',
            builder: (context, state) =>
                JobDetailView(jobId: state.pathParameters['jobId']!),
          ),
        ],
      ),
      GoRoute(
        path: '/companies',
        name: 'companies',
        builder: (context, state) => const CompanyView(),
        routes: [
          GoRoute(
            path: ':companyId',
            name: 'company-detail',
            builder: (context, state) => CompanyDetailView(
              companyId: state.pathParameters['companyId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/programs',
        name: 'programs',
        builder: (context, state) => const ProgramView(),
        routes: [
          GoRoute(
            path: ':programId',
            name: 'program-detail',
            builder: (context, state) => ProgramDetailView(
              programId: state.pathParameters['programId']!,
            ),
          ),
        ],
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationView(),
        routes: [
          GoRoute(
            path: 'deleted',
            name: 'notification-target-deleted',
            builder: (context, state) => const NotificationTargetDeletedView(),
          ),
          GoRoute(
            path: 'forbidden',
            name: 'notification-target-forbidden',
            builder: (context, state) =>
                const NotificationTargetForbiddenView(),
          ),
        ],
      ),
      GoRoute(
        path: '/mypage',
        name: 'mypage',
        builder: (context, state) => const MyPageView(),
      ),
      GoRoute(
        path: '/applications',
        name: 'applications',
        builder: (context, state) => const ApplicationView(),
        routes: [
          GoRoute(
            path: ':applicationId',
            name: 'application-detail',
            builder: (context, state) => ApplicationDetailView(
              applicationId: state.pathParameters['applicationId']!,
            ),
          ),
        ],
      ),
    ],
  );

  ref.onDispose(router.dispose);
  return router;
}
