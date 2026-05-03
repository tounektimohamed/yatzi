// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dice_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

DiceModel _$DiceModelFromJson(Map<String, dynamic> json) {
  return _DiceModel.fromJson(json);
}

/// @nodoc
mixin _$DiceModel {
  List<int> get values => throw _privateConstructorUsedError;
  List<bool> get held => throw _privateConstructorUsedError;
  int get rollsLeft => throw _privateConstructorUsedError;
  DateTime? get lastRolledAt => throw _privateConstructorUsedError;

  /// Serializes this DiceModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DiceModelCopyWith<DiceModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DiceModelCopyWith<$Res> {
  factory $DiceModelCopyWith(DiceModel value, $Res Function(DiceModel) then) =
      _$DiceModelCopyWithImpl<$Res, DiceModel>;
  @useResult
  $Res call({
    List<int> values,
    List<bool> held,
    int rollsLeft,
    DateTime? lastRolledAt,
  });
}

/// @nodoc
class _$DiceModelCopyWithImpl<$Res, $Val extends DiceModel>
    implements $DiceModelCopyWith<$Res> {
  _$DiceModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? held = null,
    Object? rollsLeft = null,
    Object? lastRolledAt = freezed,
  }) {
    return _then(
      _value.copyWith(
            values: null == values
                ? _value.values
                : values // ignore: cast_nullable_to_non_nullable
                      as List<int>,
            held: null == held
                ? _value.held
                : held // ignore: cast_nullable_to_non_nullable
                      as List<bool>,
            rollsLeft: null == rollsLeft
                ? _value.rollsLeft
                : rollsLeft // ignore: cast_nullable_to_non_nullable
                      as int,
            lastRolledAt: freezed == lastRolledAt
                ? _value.lastRolledAt
                : lastRolledAt // ignore: cast_nullable_to_non_nullable
                      as DateTime?,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$DiceModelImplCopyWith<$Res>
    implements $DiceModelCopyWith<$Res> {
  factory _$$DiceModelImplCopyWith(
    _$DiceModelImpl value,
    $Res Function(_$DiceModelImpl) then,
  ) = __$$DiceModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({
    List<int> values,
    List<bool> held,
    int rollsLeft,
    DateTime? lastRolledAt,
  });
}

/// @nodoc
class __$$DiceModelImplCopyWithImpl<$Res>
    extends _$DiceModelCopyWithImpl<$Res, _$DiceModelImpl>
    implements _$$DiceModelImplCopyWith<$Res> {
  __$$DiceModelImplCopyWithImpl(
    _$DiceModelImpl _value,
    $Res Function(_$DiceModelImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of DiceModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? values = null,
    Object? held = null,
    Object? rollsLeft = null,
    Object? lastRolledAt = freezed,
  }) {
    return _then(
      _$DiceModelImpl(
        values: null == values
            ? _value._values
            : values // ignore: cast_nullable_to_non_nullable
                  as List<int>,
        held: null == held
            ? _value._held
            : held // ignore: cast_nullable_to_non_nullable
                  as List<bool>,
        rollsLeft: null == rollsLeft
            ? _value.rollsLeft
            : rollsLeft // ignore: cast_nullable_to_non_nullable
                  as int,
        lastRolledAt: freezed == lastRolledAt
            ? _value.lastRolledAt
            : lastRolledAt // ignore: cast_nullable_to_non_nullable
                  as DateTime?,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$DiceModelImpl extends _DiceModel {
  const _$DiceModelImpl({
    final List<int> values = const [1, 1, 1, 1, 1],
    final List<bool> held = const [false, false, false, false, false],
    this.rollsLeft = 3,
    this.lastRolledAt,
  }) : _values = values,
       _held = held,
       super._();

  factory _$DiceModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$DiceModelImplFromJson(json);

  final List<int> _values;
  @override
  @JsonKey()
  List<int> get values {
    if (_values is EqualUnmodifiableListView) return _values;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_values);
  }

  final List<bool> _held;
  @override
  @JsonKey()
  List<bool> get held {
    if (_held is EqualUnmodifiableListView) return _held;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_held);
  }

  @override
  @JsonKey()
  final int rollsLeft;
  @override
  final DateTime? lastRolledAt;

  @override
  String toString() {
    return 'DiceModel(values: $values, held: $held, rollsLeft: $rollsLeft, lastRolledAt: $lastRolledAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DiceModelImpl &&
            const DeepCollectionEquality().equals(other._values, _values) &&
            const DeepCollectionEquality().equals(other._held, _held) &&
            (identical(other.rollsLeft, rollsLeft) ||
                other.rollsLeft == rollsLeft) &&
            (identical(other.lastRolledAt, lastRolledAt) ||
                other.lastRolledAt == lastRolledAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_values),
    const DeepCollectionEquality().hash(_held),
    rollsLeft,
    lastRolledAt,
  );

  /// Create a copy of DiceModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DiceModelImplCopyWith<_$DiceModelImpl> get copyWith =>
      __$$DiceModelImplCopyWithImpl<_$DiceModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DiceModelImplToJson(this);
  }
}

abstract class _DiceModel extends DiceModel {
  const factory _DiceModel({
    final List<int> values,
    final List<bool> held,
    final int rollsLeft,
    final DateTime? lastRolledAt,
  }) = _$DiceModelImpl;
  const _DiceModel._() : super._();

  factory _DiceModel.fromJson(Map<String, dynamic> json) =
      _$DiceModelImpl.fromJson;

  @override
  List<int> get values;
  @override
  List<bool> get held;
  @override
  int get rollsLeft;
  @override
  DateTime? get lastRolledAt;

  /// Create a copy of DiceModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DiceModelImplCopyWith<_$DiceModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
