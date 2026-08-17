import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:geti_app/shared/theme/app_colors.dart';
import 'package:geti_app/shared/widgets/common_error_view.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  const testCases = [
    _ErrorTestCase(
      name: '403',
      type: CommonErrorType.forbidden,
      title: '접근 권한이 없습니다.',
      description: '이 페이지를 볼 수 있는 권한이 없습니다.\n권한을 확인한 후 다시 이용해 주세요.',
      actionText: '홈으로 이동',
    ),
    _ErrorTestCase(
      name: '404',
      type: CommonErrorType.notFound,
      title: '페이지를 찾을 수 없습니다.',
      description: '주소가 잘못되었거나 페이지가\n삭제 또는 이동되었을 수 있습니다.',
      actionText: '홈으로 이동',
    ),
    _ErrorTestCase(
      name: '네트워크',
      type: CommonErrorType.network,
      title: '네트워크에 연결할 수 없습니다.',
      description: '인터넷 연결 상태를 확인한 후\n다시 시도해 주세요.',
      actionText: '다시 시도',
    ),
    _ErrorTestCase(
      name: '로그인 만료',
      type: CommonErrorType.sessionExpired,
      title: '로그인이 만료되었습니다.',
      description: '보안을 위해 로그인 시간이 만료되었습니다.\n다시 로그인하여 서비스를 이용해 주세요.',
      actionText: '다시 로그인',
    ),
  ];

  for (final testCase in testCases) {
    testWidgets('${testCase.name} 오류 상태가 Figma 문구로 표시된다', (tester) async {
      await _pumpError(tester, type: testCase.type, onAction: () {});

      expect(find.byType(CommonErrorView), findsOneWidget);
      expect(find.text(testCase.title), findsOneWidget);
      expect(find.text(testCase.description), findsOneWidget);
      expect(find.text(testCase.actionText), findsOneWidget);
      expect(find.byKey(const Key('common_error_action')), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('${testCase.name} Action은 전달받은 Callback을 한 번 호출한다', (
      tester,
    ) async {
      var callCount = 0;
      await _pumpError(
        tester,
        type: testCase.type,
        onAction: () => callCount++,
      );

      await tester.tap(find.byKey(const Key('common_error_action')));
      await tester.pump();

      expect(callCount, 1);
      expect(tester.takeException(), isNull);
    });
  }

  testWidgets('공통 오류 화면은 390x844에서 Figma 공통 레이아웃을 유지한다', (tester) async {
    await _pumpError(
      tester,
      type: CommonErrorType.sessionExpired,
      onAction: () {},
    );

    final scaffold = tester.widget<Scaffold>(find.byType(Scaffold));
    final cardRect = tester.getRect(find.byKey(const Key('common_error_card')));
    final actionRect = tester.getRect(
      find.byKey(const Key('common_error_action')),
    );

    expect(scaffold.backgroundColor, AppColors.neutral50);
    expect(scaffold.appBar, isNull);
    expect(scaffold.bottomNavigationBar, isNull);
    expect(find.byType(SafeArea), findsOneWidget);
    expect(find.byType(Icon), findsNothing);
    expect(find.byType(SvgPicture), findsNothing);
    expect(cardRect.left, closeTo(32, 0.01));
    expect(cardRect.width, closeTo(326, 0.01));
    expect(actionRect.width, closeTo(278, 0.01));
    expect(actionRect.height, closeTo(44, 0.01));
    expect(actionRect.left, greaterThanOrEqualTo(0));
    expect(actionRect.top, greaterThanOrEqualTo(0));
    expect(actionRect.right, lessThanOrEqualTo(390));
    expect(actionRect.bottom, lessThanOrEqualTo(844));
    expect(tester.takeException(), isNull);
  });
}

Future<void> _pumpError(
  WidgetTester tester, {
  required CommonErrorType type,
  required VoidCallback onAction,
}) async {
  await _setViewport(tester);
  await tester.pumpWidget(
    ScreenUtilInit(
      designSize: const Size(390, 844),
      builder: (context, _) => MaterialApp(
        home: CommonErrorView(type: type, onAction: onAction),
      ),
    ),
  );
  await tester.pump();
}

Future<void> _setViewport(WidgetTester tester) async {
  tester.view.physicalSize = const Size(390, 844);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

class _ErrorTestCase {
  const _ErrorTestCase({
    required this.name,
    required this.type,
    required this.title,
    required this.description,
    required this.actionText,
  });

  final String name;
  final CommonErrorType type;
  final String title;
  final String description;
  final String actionText;
}
