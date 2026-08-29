String formatApplicationDate(DateTime? value) {
  if (value == null) return '-';
  final local = value.toLocal();
  return '${local.year.toString().padLeft(4, '0')}.'
      '${local.month.toString().padLeft(2, '0')}.'
      '${local.day.toString().padLeft(2, '0')}';
}

String formatApplicationDateTime(DateTime? value) {
  if (value == null) return '-';
  final local = value.toLocal();
  return '${formatApplicationDate(local)} '
      '${local.hour.toString().padLeft(2, '0')}:'
      '${local.minute.toString().padLeft(2, '0')}';
}

String formatApplicationFileSize(int? bytes) {
  if (bytes == null || bytes < 0) return '';
  if (bytes < 1024) return '${bytes}B';
  final kilobytes = bytes / 1024;
  if (kilobytes < 1024) return '${_compact(kilobytes)}KB';
  final megabytes = kilobytes / 1024;
  if (megabytes < 1024) return '${_compact(megabytes)}MB';
  return '${_compact(megabytes / 1024)}GB';
}

String _compact(double value) {
  final rounded = value.toStringAsFixed(1);
  return rounded.endsWith('.0')
      ? rounded.substring(0, rounded.length - 2)
      : rounded;
}
