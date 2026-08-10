import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/app/app.dart';

void main() {
  testWidgets('기본 경로에서 맞춤 추천 결과를 표시한다', (tester) async {
    tester.view.physicalSize = const Size(390, 844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ProviderScope(child: GetiApp()));
    await tester.pumpAndSettle();

    expect(find.text('맞춤 추천'), findsOneWidget);
    expect(find.text('추천 공고 6개'), findsOneWidget);
    expect(find.text('Cloud Platform Engineer'), findsAtLeastNWidgets(1));
    expect(find.text('공고'), findsOneWidget);
    expect(tester.takeException(), isNull);
  });
}
