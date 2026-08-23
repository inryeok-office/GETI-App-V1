import 'package:geti_app/features/application/domain/model/application_summary.dart';

abstract interface class ApplicationRepository {
  Future<List<ApplicationSummary>> getMyApplications();
}
