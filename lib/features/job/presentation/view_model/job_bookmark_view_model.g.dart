// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_bookmark_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(JobBookmarkViewModel)
final jobBookmarkViewModelProvider = JobBookmarkViewModelProvider._();

final class JobBookmarkViewModelProvider
    extends $NotifierProvider<JobBookmarkViewModel, JobBookmarkViewState> {
  JobBookmarkViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jobBookmarkViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jobBookmarkViewModelHash();

  @$internal
  @override
  JobBookmarkViewModel create() => JobBookmarkViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JobBookmarkViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JobBookmarkViewState>(value),
    );
  }
}

String _$jobBookmarkViewModelHash() =>
    r'43b23ecb3c5f61fae103b3d79827681f55910bde';

abstract class _$JobBookmarkViewModel extends $Notifier<JobBookmarkViewState> {
  JobBookmarkViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<JobBookmarkViewState, JobBookmarkViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<JobBookmarkViewState, JobBookmarkViewState>,
              JobBookmarkViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
