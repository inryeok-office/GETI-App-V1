import 'package:geti_app/features/application/presentation/view/application_view.dart';
import 'package:geti_app/features/application/presentation/view/application_detail_view.dart';
import 'package:geti_app/features/job/presentation/view/job_bookmark_view.dart';
import 'package:geti_app/features/job/presentation/view/job_detail_view.dart';
import 'package:geti_app/features/job/presentation/view/job_view.dart';
import 'package:geti_app/features/recommendation/presentation/view/recommendation_view.dart';
import 'package:geti_app/features/program/presentation/view/program_view.dart';
import 'package:geti_app/features/program/presentation/view/program_detail_view.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'recommendation',
        builder: (context, state) => const RecommendationView(),
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
