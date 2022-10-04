// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'response_recipes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ResponseRecipe _$ResponseRecipeFromJson(Map<String, dynamic> json) {
  return _ResponseRecipe.fromJson(json);
}

/// @nodoc
mixin _$ResponseRecipe {
  double get count => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  String? get previous => throw _privateConstructorUsedError;
  List<Results>? get results => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResponseRecipeCopyWith<ResponseRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResponseRecipeCopyWith<$Res> {
  factory $ResponseRecipeCopyWith(
          ResponseRecipe value, $Res Function(ResponseRecipe) then) =
      _$ResponseRecipeCopyWithImpl<$Res>;
  $Res call(
      {double count, String? next, String? previous, List<Results>? results});
}

/// @nodoc
class _$ResponseRecipeCopyWithImpl<$Res>
    implements $ResponseRecipeCopyWith<$Res> {
  _$ResponseRecipeCopyWithImpl(this._value, this._then);

  final ResponseRecipe _value;
  // ignore: unused_field
  final $Res Function(ResponseRecipe) _then;

  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_value.copyWith(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: results == freezed
          ? _value.results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>?,
    ));
  }
}

/// @nodoc
abstract class _$$_ResponseRecipeCopyWith<$Res>
    implements $ResponseRecipeCopyWith<$Res> {
  factory _$$_ResponseRecipeCopyWith(
          _$_ResponseRecipe value, $Res Function(_$_ResponseRecipe) then) =
      __$$_ResponseRecipeCopyWithImpl<$Res>;
  @override
  $Res call(
      {double count, String? next, String? previous, List<Results>? results});
}

/// @nodoc
class __$$_ResponseRecipeCopyWithImpl<$Res>
    extends _$ResponseRecipeCopyWithImpl<$Res>
    implements _$$_ResponseRecipeCopyWith<$Res> {
  __$$_ResponseRecipeCopyWithImpl(
      _$_ResponseRecipe _value, $Res Function(_$_ResponseRecipe) _then)
      : super(_value, (v) => _then(v as _$_ResponseRecipe));

  @override
  _$_ResponseRecipe get _value => super._value as _$_ResponseRecipe;

  @override
  $Res call({
    Object? count = freezed,
    Object? next = freezed,
    Object? previous = freezed,
    Object? results = freezed,
  }) {
    return _then(_$_ResponseRecipe(
      count: count == freezed
          ? _value.count
          : count // ignore: cast_nullable_to_non_nullable
              as double,
      next: next == freezed
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      previous: previous == freezed
          ? _value.previous
          : previous // ignore: cast_nullable_to_non_nullable
              as String?,
      results: results == freezed
          ? _value._results
          : results // ignore: cast_nullable_to_non_nullable
              as List<Results>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ResponseRecipe implements _ResponseRecipe {
  const _$_ResponseRecipe(
      {this.count = 0, this.next, this.previous, final List<Results>? results})
      : _results = results;

  factory _$_ResponseRecipe.fromJson(Map<String, dynamic> json) =>
      _$$_ResponseRecipeFromJson(json);

  @override
  @JsonKey()
  final double count;
  @override
  final String? next;
  @override
  final String? previous;
  final List<Results>? _results;
  @override
  List<Results>? get results {
    final value = _results;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'ResponseRecipe(count: $count, next: $next, previous: $previous, results: $results)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ResponseRecipe &&
            const DeepCollectionEquality().equals(other.count, count) &&
            const DeepCollectionEquality().equals(other.next, next) &&
            const DeepCollectionEquality().equals(other.previous, previous) &&
            const DeepCollectionEquality().equals(other._results, _results));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(count),
      const DeepCollectionEquality().hash(next),
      const DeepCollectionEquality().hash(previous),
      const DeepCollectionEquality().hash(_results));

  @JsonKey(ignore: true)
  @override
  _$$_ResponseRecipeCopyWith<_$_ResponseRecipe> get copyWith =>
      __$$_ResponseRecipeCopyWithImpl<_$_ResponseRecipe>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ResponseRecipeToJson(
      this,
    );
  }
}

abstract class _ResponseRecipe implements ResponseRecipe {
  const factory _ResponseRecipe(
      {final double count,
      final String? next,
      final String? previous,
      final List<Results>? results}) = _$_ResponseRecipe;

  factory _ResponseRecipe.fromJson(Map<String, dynamic> json) =
      _$_ResponseRecipe.fromJson;

  @override
  double get count;
  @override
  String? get next;
  @override
  String? get previous;
  @override
  List<Results>? get results;
  @override
  @JsonKey(ignore: true)
  _$$_ResponseRecipeCopyWith<_$_ResponseRecipe> get copyWith =>
      throw _privateConstructorUsedError;
}
