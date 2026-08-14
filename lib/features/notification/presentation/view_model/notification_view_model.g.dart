// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(NotificationViewModel)
final notificationViewModelProvider = NotificationViewModelProvider._();

final class NotificationViewModelProvider
    extends $NotifierProvider<NotificationViewModel, NotificationViewState> {
  NotificationViewModelProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'notificationViewModelProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$notificationViewModelHash();

  @$internal
  @override
  NotificationViewModel create() => NotificationViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(NotificationViewState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<NotificationViewState>(value),
    );
  }
}

String _$notificationViewModelHash() =>
    r'1ed83ae9987fecc6f9bb0e5939f2a5082161b4f1';

abstract class _$NotificationViewModel
    extends $Notifier<NotificationViewState> {
  NotificationViewState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final ref = this.ref as $Ref<NotificationViewState, NotificationViewState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<NotificationViewState, NotificationViewState>,
              NotificationViewState,
              Object?,
              Object?
            >;
    element.handleCreate(ref, build);
  }
}
