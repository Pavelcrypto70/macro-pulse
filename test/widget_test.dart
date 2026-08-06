import 'package:flutter_test/flutter_test.dart';
import 'package:macro_pulse/main.dart';

void main() {
  testWidgets('Macro Pulse boots', (tester) async {
    await tester.pumpWidget(const MacroPulseApp());
    await tester.pump(const Duration(milliseconds: 100));
    expect(find.textContaining('Macro Pulse'), findsWidgets);
  });
}
