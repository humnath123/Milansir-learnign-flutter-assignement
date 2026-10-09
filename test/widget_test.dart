import 'package:flutter_test/flutter_test.dart';
import 'package:manual_flutter_project/main.dart';

void main() {
  testWidgets('MyShop app loads', (WidgetTester tester) async {
    await tester.pumpWidget(const EcommerceSachin());

    expect(find.text('MyShop'), findsOneWidget);
  });
}
