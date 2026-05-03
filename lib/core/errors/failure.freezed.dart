// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Failure {
  String get message => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) => throw _privateConstructorUsedError;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $FailureCopyWith<Failure> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureCopyWith<$Res> {
  factory $FailureCopyWith(Failure value, $Res Function(Failure) then) =
      _$FailureCopyWithImpl<$Res, Failure>;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$FailureCopyWithImpl<$Res, $Val extends Failure>
    implements $FailureCopyWith<$Res> {
  _$FailureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _value.copyWith(
            message: null == message
                ? _value.message
                : message // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ServerErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ServerErrorImplCopyWith(
    _$ServerErrorImpl value,
    $Res Function(_$ServerErrorImpl) then,
  ) = __$$ServerErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ServerErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ServerErrorImpl>
    implements _$$ServerErrorImplCopyWith<$Res> {
  __$$ServerErrorImplCopyWithImpl(
    _$ServerErrorImpl _value,
    $Res Function(_$ServerErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ServerErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ServerErrorImpl implements ServerError {
  const _$ServerErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.serverError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ServerErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      __$$ServerErrorImplCopyWithImpl<_$ServerErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return serverError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return serverError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return serverError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements Failure {
  const factory ServerError({required final String message}) =
      _$ServerErrorImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ServerErrorImplCopyWith<_$ServerErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NetworkErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NetworkErrorImplCopyWith(
    _$NetworkErrorImpl value,
    $Res Function(_$NetworkErrorImpl) then,
  ) = __$$NetworkErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NetworkErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NetworkErrorImpl>
    implements _$$NetworkErrorImplCopyWith<$Res> {
  __$$NetworkErrorImplCopyWithImpl(
    _$NetworkErrorImpl _value,
    $Res Function(_$NetworkErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NetworkErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NetworkErrorImpl implements NetworkError {
  const _$NetworkErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.networkError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NetworkErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      __$$NetworkErrorImplCopyWithImpl<_$NetworkErrorImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return networkError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return networkError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return networkError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return networkError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (networkError != null) {
      return networkError(this);
    }
    return orElse();
  }
}

abstract class NetworkError implements Failure {
  const factory NetworkError({required final String message}) =
      _$NetworkErrorImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NetworkErrorImplCopyWith<_$NetworkErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ValidationErrorImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$ValidationErrorImplCopyWith(
    _$ValidationErrorImpl value,
    $Res Function(_$ValidationErrorImpl) then,
  ) = __$$ValidationErrorImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$ValidationErrorImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$ValidationErrorImpl>
    implements _$$ValidationErrorImplCopyWith<$Res> {
  __$$ValidationErrorImplCopyWithImpl(
    _$ValidationErrorImpl _value,
    $Res Function(_$ValidationErrorImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$ValidationErrorImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$ValidationErrorImpl implements ValidationError {
  const _$ValidationErrorImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.validationError(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ValidationErrorImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      __$$ValidationErrorImplCopyWithImpl<_$ValidationErrorImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return validationError(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return validationError?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return validationError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return validationError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (validationError != null) {
      return validationError(this);
    }
    return orElse();
  }
}

abstract class ValidationError implements Failure {
  const factory ValidationError({required final String message}) =
      _$ValidationErrorImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ValidationErrorImplCopyWith<_$ValidationErrorImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UnauthorizedImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$UnauthorizedImplCopyWith(
    _$UnauthorizedImpl value,
    $Res Function(_$UnauthorizedImpl) then,
  ) = __$$UnauthorizedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$UnauthorizedImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$UnauthorizedImpl>
    implements _$$UnauthorizedImplCopyWith<$Res> {
  __$$UnauthorizedImplCopyWithImpl(
    _$UnauthorizedImpl _value,
    $Res Function(_$UnauthorizedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$UnauthorizedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$UnauthorizedImpl implements Unauthorized {
  const _$UnauthorizedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.unauthorized(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UnauthorizedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      __$$UnauthorizedImplCopyWithImpl<_$UnauthorizedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return unauthorized(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return unauthorized?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return unauthorized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return unauthorized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (unauthorized != null) {
      return unauthorized(this);
    }
    return orElse();
  }
}

abstract class Unauthorized implements Failure {
  const factory Unauthorized({required final String message}) =
      _$UnauthorizedImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UnauthorizedImplCopyWith<_$UnauthorizedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotFoundImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$NotFoundImplCopyWith(
    _$NotFoundImpl value,
    $Res Function(_$NotFoundImpl) then,
  ) = __$$NotFoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotFoundImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotFoundImpl>
    implements _$$NotFoundImplCopyWith<$Res> {
  __$$NotFoundImplCopyWithImpl(
    _$NotFoundImpl _value,
    $Res Function(_$NotFoundImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NotFoundImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NotFoundImpl implements NotFound {
  const _$NotFoundImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.notFound(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotFoundImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      __$$NotFoundImplCopyWithImpl<_$NotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return notFound(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return notFound?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }
}

abstract class NotFound implements Failure {
  const factory NotFound({required final String message}) = _$NotFoundImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotFoundImplCopyWith<_$NotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameFullImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$GameFullImplCopyWith(
    _$GameFullImpl value,
    $Res Function(_$GameFullImpl) then,
  ) = __$$GameFullImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GameFullImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$GameFullImpl>
    implements _$$GameFullImplCopyWith<$Res> {
  __$$GameFullImplCopyWithImpl(
    _$GameFullImpl _value,
    $Res Function(_$GameFullImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$GameFullImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GameFullImpl implements GameFull {
  const _$GameFullImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.gameFull(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameFullImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameFullImplCopyWith<_$GameFullImpl> get copyWith =>
      __$$GameFullImplCopyWithImpl<_$GameFullImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return gameFull(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return gameFull?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (gameFull != null) {
      return gameFull(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return gameFull(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return gameFull?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (gameFull != null) {
      return gameFull(this);
    }
    return orElse();
  }
}

abstract class GameFull implements Failure {
  const factory GameFull({required final String message}) = _$GameFullImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameFullImplCopyWith<_$GameFullImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InvalidRoomCodeImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$InvalidRoomCodeImplCopyWith(
    _$InvalidRoomCodeImpl value,
    $Res Function(_$InvalidRoomCodeImpl) then,
  ) = __$$InvalidRoomCodeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$InvalidRoomCodeImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$InvalidRoomCodeImpl>
    implements _$$InvalidRoomCodeImplCopyWith<$Res> {
  __$$InvalidRoomCodeImplCopyWithImpl(
    _$InvalidRoomCodeImpl _value,
    $Res Function(_$InvalidRoomCodeImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$InvalidRoomCodeImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$InvalidRoomCodeImpl implements InvalidRoomCode {
  const _$InvalidRoomCodeImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.invalidRoomCode(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InvalidRoomCodeImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$InvalidRoomCodeImplCopyWith<_$InvalidRoomCodeImpl> get copyWith =>
      __$$InvalidRoomCodeImplCopyWithImpl<_$InvalidRoomCodeImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return invalidRoomCode(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return invalidRoomCode?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (invalidRoomCode != null) {
      return invalidRoomCode(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return invalidRoomCode(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return invalidRoomCode?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (invalidRoomCode != null) {
      return invalidRoomCode(this);
    }
    return orElse();
  }
}

abstract class InvalidRoomCode implements Failure {
  const factory InvalidRoomCode({required final String message}) =
      _$InvalidRoomCodeImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$InvalidRoomCodeImplCopyWith<_$InvalidRoomCodeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotYourTurnImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotYourTurnImplCopyWith(
    _$NotYourTurnImpl value,
    $Res Function(_$NotYourTurnImpl) then,
  ) = __$$NotYourTurnImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotYourTurnImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotYourTurnImpl>
    implements _$$NotYourTurnImplCopyWith<$Res> {
  __$$NotYourTurnImplCopyWithImpl(
    _$NotYourTurnImpl _value,
    $Res Function(_$NotYourTurnImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NotYourTurnImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NotYourTurnImpl implements NotYourTurn {
  const _$NotYourTurnImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.notYourTurn(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotYourTurnImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotYourTurnImplCopyWith<_$NotYourTurnImpl> get copyWith =>
      __$$NotYourTurnImplCopyWithImpl<_$NotYourTurnImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return notYourTurn(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return notYourTurn?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (notYourTurn != null) {
      return notYourTurn(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return notYourTurn(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return notYourTurn?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (notYourTurn != null) {
      return notYourTurn(this);
    }
    return orElse();
  }
}

abstract class NotYourTurn implements Failure {
  const factory NotYourTurn({required final String message}) =
      _$NotYourTurnImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotYourTurnImplCopyWith<_$NotYourTurnImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$CategoryAlreadyFilledImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$CategoryAlreadyFilledImplCopyWith(
    _$CategoryAlreadyFilledImpl value,
    $Res Function(_$CategoryAlreadyFilledImpl) then,
  ) = __$$CategoryAlreadyFilledImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$CategoryAlreadyFilledImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$CategoryAlreadyFilledImpl>
    implements _$$CategoryAlreadyFilledImplCopyWith<$Res> {
  __$$CategoryAlreadyFilledImplCopyWithImpl(
    _$CategoryAlreadyFilledImpl _value,
    $Res Function(_$CategoryAlreadyFilledImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$CategoryAlreadyFilledImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$CategoryAlreadyFilledImpl implements CategoryAlreadyFilled {
  const _$CategoryAlreadyFilledImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.categoryAlreadyFilled(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryAlreadyFilledImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryAlreadyFilledImplCopyWith<_$CategoryAlreadyFilledImpl>
  get copyWith =>
      __$$CategoryAlreadyFilledImplCopyWithImpl<_$CategoryAlreadyFilledImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return categoryAlreadyFilled(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return categoryAlreadyFilled?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (categoryAlreadyFilled != null) {
      return categoryAlreadyFilled(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return categoryAlreadyFilled(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return categoryAlreadyFilled?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (categoryAlreadyFilled != null) {
      return categoryAlreadyFilled(this);
    }
    return orElse();
  }
}

abstract class CategoryAlreadyFilled implements Failure {
  const factory CategoryAlreadyFilled({required final String message}) =
      _$CategoryAlreadyFilledImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryAlreadyFilledImplCopyWith<_$CategoryAlreadyFilledImpl>
  get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotEnoughPlayersImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$NotEnoughPlayersImplCopyWith(
    _$NotEnoughPlayersImpl value,
    $Res Function(_$NotEnoughPlayersImpl) then,
  ) = __$$NotEnoughPlayersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotEnoughPlayersImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotEnoughPlayersImpl>
    implements _$$NotEnoughPlayersImplCopyWith<$Res> {
  __$$NotEnoughPlayersImplCopyWithImpl(
    _$NotEnoughPlayersImpl _value,
    $Res Function(_$NotEnoughPlayersImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NotEnoughPlayersImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NotEnoughPlayersImpl implements NotEnoughPlayers {
  const _$NotEnoughPlayersImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.notEnoughPlayers(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotEnoughPlayersImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotEnoughPlayersImplCopyWith<_$NotEnoughPlayersImpl> get copyWith =>
      __$$NotEnoughPlayersImplCopyWithImpl<_$NotEnoughPlayersImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return notEnoughPlayers(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return notEnoughPlayers?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (notEnoughPlayers != null) {
      return notEnoughPlayers(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return notEnoughPlayers(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return notEnoughPlayers?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (notEnoughPlayers != null) {
      return notEnoughPlayers(this);
    }
    return orElse();
  }
}

abstract class NotEnoughPlayers implements Failure {
  const factory NotEnoughPlayers({required final String message}) =
      _$NotEnoughPlayersImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotEnoughPlayersImplCopyWith<_$NotEnoughPlayersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NotHostImplCopyWith<$Res> implements $FailureCopyWith<$Res> {
  factory _$$NotHostImplCopyWith(
    _$NotHostImpl value,
    $Res Function(_$NotHostImpl) then,
  ) = __$$NotHostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$NotHostImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$NotHostImpl>
    implements _$$NotHostImplCopyWith<$Res> {
  __$$NotHostImplCopyWithImpl(
    _$NotHostImpl _value,
    $Res Function(_$NotHostImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$NotHostImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$NotHostImpl implements NotHost {
  const _$NotHostImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.notHost(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotHostImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotHostImplCopyWith<_$NotHostImpl> get copyWith =>
      __$$NotHostImplCopyWithImpl<_$NotHostImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return notHost(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return notHost?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (notHost != null) {
      return notHost(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return notHost(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return notHost?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (notHost != null) {
      return notHost(this);
    }
    return orElse();
  }
}

abstract class NotHost implements Failure {
  const factory NotHost({required final String message}) = _$NotHostImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotHostImplCopyWith<_$NotHostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameAlreadyStartedImplCopyWith<$Res>
    implements $FailureCopyWith<$Res> {
  factory _$$GameAlreadyStartedImplCopyWith(
    _$GameAlreadyStartedImpl value,
    $Res Function(_$GameAlreadyStartedImpl) then,
  ) = __$$GameAlreadyStartedImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$$GameAlreadyStartedImplCopyWithImpl<$Res>
    extends _$FailureCopyWithImpl<$Res, _$GameAlreadyStartedImpl>
    implements _$$GameAlreadyStartedImplCopyWith<$Res> {
  __$$GameAlreadyStartedImplCopyWithImpl(
    _$GameAlreadyStartedImpl _value,
    $Res Function(_$GameAlreadyStartedImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? message = null}) {
    return _then(
      _$GameAlreadyStartedImpl(
        message: null == message
            ? _value.message
            : message // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc

class _$GameAlreadyStartedImpl implements GameAlreadyStarted {
  const _$GameAlreadyStartedImpl({required this.message});

  @override
  final String message;

  @override
  String toString() {
    return 'Failure.gameAlreadyStarted(message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameAlreadyStartedImpl &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameAlreadyStartedImplCopyWith<_$GameAlreadyStartedImpl> get copyWith =>
      __$$GameAlreadyStartedImplCopyWithImpl<_$GameAlreadyStartedImpl>(
        this,
        _$identity,
      );

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(String message) serverError,
    required TResult Function(String message) networkError,
    required TResult Function(String message) validationError,
    required TResult Function(String message) unauthorized,
    required TResult Function(String message) notFound,
    required TResult Function(String message) gameFull,
    required TResult Function(String message) invalidRoomCode,
    required TResult Function(String message) notYourTurn,
    required TResult Function(String message) categoryAlreadyFilled,
    required TResult Function(String message) notEnoughPlayers,
    required TResult Function(String message) notHost,
    required TResult Function(String message) gameAlreadyStarted,
  }) {
    return gameAlreadyStarted(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(String message)? serverError,
    TResult? Function(String message)? networkError,
    TResult? Function(String message)? validationError,
    TResult? Function(String message)? unauthorized,
    TResult? Function(String message)? notFound,
    TResult? Function(String message)? gameFull,
    TResult? Function(String message)? invalidRoomCode,
    TResult? Function(String message)? notYourTurn,
    TResult? Function(String message)? categoryAlreadyFilled,
    TResult? Function(String message)? notEnoughPlayers,
    TResult? Function(String message)? notHost,
    TResult? Function(String message)? gameAlreadyStarted,
  }) {
    return gameAlreadyStarted?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(String message)? serverError,
    TResult Function(String message)? networkError,
    TResult Function(String message)? validationError,
    TResult Function(String message)? unauthorized,
    TResult Function(String message)? notFound,
    TResult Function(String message)? gameFull,
    TResult Function(String message)? invalidRoomCode,
    TResult Function(String message)? notYourTurn,
    TResult Function(String message)? categoryAlreadyFilled,
    TResult Function(String message)? notEnoughPlayers,
    TResult Function(String message)? notHost,
    TResult Function(String message)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (gameAlreadyStarted != null) {
      return gameAlreadyStarted(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(ServerError value) serverError,
    required TResult Function(NetworkError value) networkError,
    required TResult Function(ValidationError value) validationError,
    required TResult Function(Unauthorized value) unauthorized,
    required TResult Function(NotFound value) notFound,
    required TResult Function(GameFull value) gameFull,
    required TResult Function(InvalidRoomCode value) invalidRoomCode,
    required TResult Function(NotYourTurn value) notYourTurn,
    required TResult Function(CategoryAlreadyFilled value)
    categoryAlreadyFilled,
    required TResult Function(NotEnoughPlayers value) notEnoughPlayers,
    required TResult Function(NotHost value) notHost,
    required TResult Function(GameAlreadyStarted value) gameAlreadyStarted,
  }) {
    return gameAlreadyStarted(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(ServerError value)? serverError,
    TResult? Function(NetworkError value)? networkError,
    TResult? Function(ValidationError value)? validationError,
    TResult? Function(Unauthorized value)? unauthorized,
    TResult? Function(NotFound value)? notFound,
    TResult? Function(GameFull value)? gameFull,
    TResult? Function(InvalidRoomCode value)? invalidRoomCode,
    TResult? Function(NotYourTurn value)? notYourTurn,
    TResult? Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult? Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult? Function(NotHost value)? notHost,
    TResult? Function(GameAlreadyStarted value)? gameAlreadyStarted,
  }) {
    return gameAlreadyStarted?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(ServerError value)? serverError,
    TResult Function(NetworkError value)? networkError,
    TResult Function(ValidationError value)? validationError,
    TResult Function(Unauthorized value)? unauthorized,
    TResult Function(NotFound value)? notFound,
    TResult Function(GameFull value)? gameFull,
    TResult Function(InvalidRoomCode value)? invalidRoomCode,
    TResult Function(NotYourTurn value)? notYourTurn,
    TResult Function(CategoryAlreadyFilled value)? categoryAlreadyFilled,
    TResult Function(NotEnoughPlayers value)? notEnoughPlayers,
    TResult Function(NotHost value)? notHost,
    TResult Function(GameAlreadyStarted value)? gameAlreadyStarted,
    required TResult orElse(),
  }) {
    if (gameAlreadyStarted != null) {
      return gameAlreadyStarted(this);
    }
    return orElse();
  }
}

abstract class GameAlreadyStarted implements Failure {
  const factory GameAlreadyStarted({required final String message}) =
      _$GameAlreadyStartedImpl;

  @override
  String get message;

  /// Create a copy of Failure
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameAlreadyStartedImplCopyWith<_$GameAlreadyStartedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
