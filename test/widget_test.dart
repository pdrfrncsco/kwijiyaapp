import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kwijiya/main.dart';

void main() {
  testWidgets('App builds and shows splash screen', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const ProviderScope(child: KwijiyaApp()));

    // Verify that Splash Screen is shown
    expect(find.text('Kwijiya'), findsOneWidget);
  });
}
