// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'job_detail_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(JobDetailViewModel)
final jobDetailViewModelProvider = JobDetailViewModelFamily._();

final class JobDetailViewModelProvider
    extends $NotifierProvider<JobDetailViewModel, JobDetailViewState> {
  JobDetailViewModelProvider._({
    required JobDetailViewModelFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'jobDetailViewModelProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$jobDetailViewModelHash();

  @override
  String toString() {
    return r'jobDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  JobDetailViewModel create() => JobDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(JobDetailViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<JobDetailViewState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is JobDetailViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$jobDetailViewModelHash() =>
    r'ef8aae3ad200430be8a41218ab60e0e8b317e848';

final class JobDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<
          JobDetailViewModel,
          JobDetailViewState,
          JobDetailViewState,
          JobDetailViewState,
          String
        > {
  JobDetailViewModelFamily._()
    : super(
        retry: null,
        name: r'jobDetailViewModelProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  JobDetailViewModelProvider call(String jobId) =>
      JobDetailViewModelProvider._(argument: jobId, from: this);

  @override
  String toString() => r'jobDetailViewModelProvider';
}

abstract class _$JobDetailViewModel extends $Notifier<JobDetailViewState> {
  late final _$args = ref.$arg as String;
  String get jobId => _$args;

  JobDetailViewState build(String jobId);
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<JobDetailViewState, JobDetailViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<JobDetailViewState, JobDetailViewState>,
              JobDetailViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, () => build(_$args));
  }
}
