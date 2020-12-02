import 'package:mps/app/domain/report/report.dart';

class ReportGenerator<T extends Report>{
  T report;
  ReportGenerator(this.report);

  T generate() => report;
}