// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boomarks.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$Boomarks {
  List<Bookmark> get list => throw _privateConstructorUsedError;

  /// Create a copy of Boomarks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BoomarksCopyWith<Boomarks> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BoomarksCopyWith<$Res> {
  factory $BoomarksCopyWith(Boomarks value, $Res Function(Boomarks) then) =
      _$BoomarksCopyWithImpl<$Res, Boomarks>;
  @useResult
  $Res call({List<Bookmark> list});
}

/// @nodoc
class _$BoomarksCopyWithImpl<$Res, $Val extends Boomarks>
    implements $BoomarksCopyWith<$Res> {
  _$BoomarksCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Boomarks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? list = null}) {
    return _then(
      _value.copyWith(
            list:
                null == list
                    ? _value.list
                    : list // ignore: cast_nullable_to_non_nullable
                        as List<Bookmark>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$BookmarksImplCopyWith<$Res>
    implements $BoomarksCopyWith<$Res> {
  factory _$$BookmarksImplCopyWith(
    _$BookmarksImpl value,
    $Res Function(_$BookmarksImpl) then,
  ) = __$$BookmarksImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Bookmark> list});
}

/// @nodoc
class __$$BookmarksImplCopyWithImpl<$Res>
    extends _$BoomarksCopyWithImpl<$Res, _$BookmarksImpl>
    implements _$$BookmarksImplCopyWith<$Res> {
  __$$BookmarksImplCopyWithImpl(
    _$BookmarksImpl _value,
    $Res Function(_$BookmarksImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of Boomarks
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? list = null}) {
    return _then(
      _$BookmarksImpl(
        list:
            null == list
                ? _value.list
                : list // ignore: cast_nullable_to_non_nullable
                    as List<Bookmark>,
      ),
    );
  }
}

/// @nodoc

class _$BookmarksImpl implements _Bookmarks {
  const _$BookmarksImpl({required this.list});

  @override
  final List<Bookmark> list;

  @override
  String toString() {
    return 'Boomarks(list: $list)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookmarksImpl &&
            const DeepCollectionEquality().equals(other.list, list));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(list));

  /// Create a copy of Boomarks
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BookmarksImplCopyWith<_$BookmarksImpl> get copyWith =>
      __$$BookmarksImplCopyWithImpl<_$BookmarksImpl>(this, _$identity);
}

abstract class _Bookmarks implements Boomarks {
  const factory _Bookmarks({required final List<Bookmark> list}) =
      _$BookmarksImpl;

  @override
  List<Bookmark> get list;

  /// Create a copy of Boomarks
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BookmarksImplCopyWith<_$BookmarksImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
