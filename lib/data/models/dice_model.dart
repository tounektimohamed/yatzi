import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dice_model.freezed.dart';
part 'dice_model.g.dart';

@freezed
class DiceModel with _$DiceModel {
  const DiceModel._();

  const factory DiceModel({
    @Default([1, 1, 1, 1, 1]) List<int> values,
    @Default([false, false, false, false, false]) List<bool> held,
    @Default(3) int rollsLeft,
    DateTime? lastRolledAt,
  }) = _DiceModel;

  factory DiceModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
    SnapshotOptions? options,
  ) {
    final data = doc.data()!;
    return DiceModel(
      values: (data['values'] as List?)?.map((e) => (e as num).toInt()).toList() ??
          [1, 1, 1, 1, 1],
      held: (data['held'] as List?)?.map((e) => e as bool).toList() ??
          [false, false, false, false, false],
      rollsLeft: (data['rollsLeft'] as num?)?.toInt() ?? 3,
      lastRolledAt: data['lastRolledAt'] != null
          ? (data['lastRolledAt'] as Timestamp).toDate()
          : null,
    );
  }

  Map<String, Object?> toFirestore() {
    return {
      'values': values,
      'held': held,
      'rollsLeft': rollsLeft,
      'lastRolledAt':
          lastRolledAt != null ? Timestamp.fromDate(lastRolledAt!) : null,
    };
  }

  factory DiceModel.fromJson(Map<String, dynamic> json) =>
      _$DiceModelFromJson(json);

  bool get canRoll => rollsLeft > 0;

  DiceModel toggleHeld(int index) {
    if (index < 0 || index >= held.length) return this;
    final newHeld = List<bool>.from(held);
    newHeld[index] = !newHeld[index];
    return copyWith(held: newHeld);
  }

  DiceModel reset() {
    return copyWith(
      values: List.filled(5, 1),
      held: List.filled(5, false),
      rollsLeft: 3,
    );
  }
}
