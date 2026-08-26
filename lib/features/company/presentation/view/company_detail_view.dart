import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geti_app/features/company/presentation/view_model/company_detail_view_model.dart';
import 'package:geti_app/features/company/presentation/view_model/company_view_model.dart';
import 'package:geti_app/features/company/presentation/widgets/company_state_content.dart';
import 'package:geti_app/features/job/presentation/view_model/job_view_model.dart';
import 'package:geti_app/features/job/presentation/widgets/job_card.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/theme/app_typography.dart';
import 'package:go_router/go_router.dart';

class CompanyDetailView extends ConsumerWidget {
  const CompanyDetailView({required this.companyId, super.key});
  final String companyId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(companyDetailViewModelProvider(companyId));
    final company = state.company;
    final detail = state.detail;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        toolbarHeight: 56.h,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColors.surface,
        surfaceTintColor: AppColors.surface,
        shape: const Border(bottom: BorderSide(color: AppColors.neutral200)),
        leadingWidth: 52.w,
        leading: IconButton(
          key: const ValueKey('company-detail-back'),
          onPressed: () {
            if (context.canPop()) {
              context.pop();
            } else {
              context.go('/companies');
            }
          },
          icon: Icon(Icons.chevron_left, size: 28.w),
          color: AppColors.neutral600,
        ),
        titleSpacing: 0,
        title: Text(
          '기업 상세',
          style: AppTypography.heading2.copyWith(color: AppColors.neutral900),
        ),
      ),
      body: company == null || detail == null
          ? const _CompanyNotFound()
          : _CompanyDetailBody(
              companyId: companyId,
              company: company,
              detail: detail,
              jobs: state.jobs,
            ),
    );
  }
}

class _CompanyNotFound extends StatelessWidget {
  const _CompanyNotFound();
  @override
  Widget build(BuildContext context) => Center(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.error_outline, size: 48.w, color: AppColors.neutral600),
        SizedBox(height: 16.h),
        Text(
          '해당 기업 정보에 접근할 수 없습니다.',
          style: AppTypography.bodyLarge.copyWith(
            color: AppColors.neutral900,
            fontWeight: FontWeight.w600,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          '해당 기업은 삭제되거나 비공개 처리 되었습니다.',
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
      ],
    ),
  );
}

class _CompanyDetailBody extends ConsumerWidget {
  const _CompanyDetailBody({
    required this.companyId,
    required this.company,
    required this.detail,
    required this.jobs,
  });

  final String companyId;
  final CompanyItem company;
  final CompanyDetail detail;
  final List<JobItem> jobs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SingleChildScrollView(
      padding: EdgeInsets.symmetric(vertical: 24.h),
      child: Center(
        child: SizedBox(
          width: 326.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _CompanySummaryCard(company: company, detail: detail),
              SizedBox(height: 16.h),
              _Section(title: '기업 소개', body: detail.description),
              SizedBox(height: 16.h),
              _CompanyInfoCard(company: company, detail: detail),
              SizedBox(height: 16.h),
              Text(
                '채용 공고 ${jobs.length}',
                style: AppTypography.heading3.copyWith(
                  color: AppColors.neutral900,
                ),
              ),
              SizedBox(height: 12.h),
              if (jobs.isEmpty)
                const CompanyNoActiveJobsState()
              else
                Column(
                  children: [
                    for (final job in jobs) ...[
                      JobCard(
                        job: job,
                        isBookmarked: job.bookmarked,
                        onTap: () => context.push('/jobs/${job.id}'),
                        onBookmarkTap: () => ref
                            .read(
                              companyDetailViewModelProvider(
                                companyId,
                              ).notifier,
                            )
                            .toggleBookmark(
                              job.id,
                              currentlyBookmarked: job.bookmarked,
                            ),
                      ),
                      SizedBox(height: 12.h),
                    ],
                  ],
                ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CompanySummaryCard extends StatelessWidget {
  const _CompanySummaryCard({required this.company, required this.detail});
  final CompanyItem company;
  final CompanyDetail detail;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 56.w,
              height: 56.w,
              decoration: BoxDecoration(
                color: AppColors.background,
                border: Border.all(color: AppColors.neutral200),
                borderRadius: BorderRadius.circular(12.r),
              ),
            ),
            SizedBox(width: 16.w),
            Expanded(
              child: Text(
                company.name,
                style: AppTypography.heading1.copyWith(
                  color: AppColors.neutral900,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 12.h),
        Text(
          company.typeLabel,
          style: AppTypography.body.copyWith(color: AppColors.neutral600),
        ),
        if (company.isMou) ...[
          SizedBox(height: 8.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
            decoration: BoxDecoration(
              color: AppColors.primarySubtle,
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: Text(
              'MOU 기업',
              style: AppTypography.captionMedium.copyWith(
                color: AppColors.primary,
              ),
            ),
          ),
        ],
        SizedBox(height: 16.h),
        SizedBox(
          width: double.infinity,
          height: 42.h,
          child: OutlinedButton.icon(
            key: const ValueKey('company-homepage-link'),
            onPressed: () => showDialog<void>(
              context: context,
              builder: (context) => AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.r),
                ),
                title: Text(
                  '기업 홈페이지로 이동합니다.',
                  style: AppTypography.heading3.copyWith(
                    color: AppColors.neutral900,
                  ),
                ),
                content: Text(
                  detail.homepageUrl,
                  style: AppTypography.body.copyWith(
                    color: AppColors.neutral600,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(
                      '확인',
                      style: AppTypography.label.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: AppColors.onPrimary,
              backgroundColor: AppColors.primary,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            icon: Icon(Icons.open_in_new, size: 18.w),
            label: Text(
              '기업 홈페이지',
              style: AppTypography.label.copyWith(color: AppColors.onPrimary),
            ),
          ),
        ),
      ],
    ),
  );
}

class _Section extends StatelessWidget {
  const _Section({required this.title, required this.body});
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) => Container(
    width: double.infinity,
    padding: EdgeInsets.all(16.w),
    decoration: BoxDecoration(
      color: AppColors.surface,
      border: Border.all(color: AppColors.neutral200),
      borderRadius: BorderRadius.circular(16.r),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
        ),
        SizedBox(height: 12.h),
        Text(
          body,
          style: AppTypography.bodyLarge.copyWith(color: AppColors.neutral800),
        ),
      ],
    ),
  );
}

class _CompanyInfoCard extends StatelessWidget {
  const _CompanyInfoCard({required this.company, required this.detail});
  final CompanyItem company;
  final CompanyDetail detail;

  @override
  Widget build(BuildContext context) {
    final rows = <(String, String)>[
      ('업종', detail.industry),
      ('기업 유형', company.typeLabel),
      ('주소', detail.address),
      ('MOU 여부', company.isMou ? 'MOU 기업' : '해당 없음'),
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: AppColors.surface,
        border: Border.all(color: AppColors.neutral200),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '기업 정보',
            style: AppTypography.heading3.copyWith(color: AppColors.neutral900),
          ),
          SizedBox(height: 16.h),
          for (final row in rows)
            Padding(
              padding: EdgeInsets.only(bottom: 12.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    row.$1,
                    style: AppTypography.body.copyWith(
                      color: AppColors.neutral600,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      row.$2,
                      textAlign: TextAlign.right,
                      style: AppTypography.body.copyWith(
                        color: AppColors.neutral900,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
