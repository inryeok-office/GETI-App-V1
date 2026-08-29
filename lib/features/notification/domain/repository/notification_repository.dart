import 'package:geti_app/features/notification/domain/model/notification_summary.dart';

abstract interface class NotificationRepository {
  Future<NotificationListResult> getNotifications({required bool unreadOnly});
}
