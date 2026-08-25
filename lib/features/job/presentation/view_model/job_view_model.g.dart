// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(JobViewModel)
final jobViewModelProvider = JobViewModelProvider._();

final class JobViewModelProvider
    extends $NotifierProvider<JobViewModel, JobViewState> {
  JobViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'jobViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$jobViewModelHash();

  @$internal
  @override
  JobViewModel create() => JobViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JobViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JobViewState>(value),
    );
  }
}

String _$jobViewModelHash() => r'9801da64bf9cb2321cb96424071f7c8207e7e538';

abstract class _$JobViewModel extends $Notifier<JobViewState> {
  JobViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<JobViewState, JobViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<JobViewState, JobViewState>,
              JobViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
