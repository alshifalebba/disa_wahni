// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'vehicle_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$VehicleEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleEvent()';
}


}

/// @nodoc
class $VehicleEventCopyWith<$Res>  {
$VehicleEventCopyWith(VehicleEvent _, $Res Function(VehicleEvent) __);
}


/// Adds pattern-matching-related methods to [VehicleEvent].
extension VehicleEventPatterns on VehicleEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _GetVehicleTypes value)?  getVehicleTypes,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GetVehicleTypes() when getVehicleTypes != null:
return getVehicleTypes(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _GetVehicleTypes value)  getVehicleTypes,}){
final _that = this;
switch (_that) {
case _GetVehicleTypes():
return getVehicleTypes(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _GetVehicleTypes value)?  getVehicleTypes,}){
final _that = this;
switch (_that) {
case _GetVehicleTypes() when getVehicleTypes != null:
return getVehicleTypes(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  getVehicleTypes,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GetVehicleTypes() when getVehicleTypes != null:
return getVehicleTypes();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  getVehicleTypes,}) {final _that = this;
switch (_that) {
case _GetVehicleTypes():
return getVehicleTypes();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  getVehicleTypes,}) {final _that = this;
switch (_that) {
case _GetVehicleTypes() when getVehicleTypes != null:
return getVehicleTypes();case _:
  return null;

}
}

}

/// @nodoc


class _GetVehicleTypes implements VehicleEvent {
  const _GetVehicleTypes();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GetVehicleTypes);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'VehicleEvent.getVehicleTypes()';
}


}




/// @nodoc
mixin _$VehicleState {

 bool get isLoading; List<String> get vehicles; String? get errorMessage;
/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VehicleStateCopyWith<VehicleState> get copyWith => _$VehicleStateCopyWithImpl<VehicleState>(this as VehicleState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VehicleState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other.vehicles, vehicles)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(vehicles),errorMessage);

@override
String toString() {
  return 'VehicleState(isLoading: $isLoading, vehicles: $vehicles, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class $VehicleStateCopyWith<$Res>  {
  factory $VehicleStateCopyWith(VehicleState value, $Res Function(VehicleState) _then) = _$VehicleStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, List<String> vehicles, String? errorMessage
});




}
/// @nodoc
class _$VehicleStateCopyWithImpl<$Res>
    implements $VehicleStateCopyWith<$Res> {
  _$VehicleStateCopyWithImpl(this._self, this._then);

  final VehicleState _self;
  final $Res Function(VehicleState) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? vehicles = null,Object? errorMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,vehicles: null == vehicles ? _self.vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [VehicleState].
extension VehicleStatePatterns on VehicleState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VehicleState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VehicleState() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VehicleState value)  $default,){
final _that = this;
switch (_that) {
case _VehicleState():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VehicleState value)?  $default,){
final _that = this;
switch (_that) {
case _VehicleState() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  List<String> vehicles,  String? errorMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VehicleState() when $default != null:
return $default(_that.isLoading,_that.vehicles,_that.errorMessage);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  List<String> vehicles,  String? errorMessage)  $default,) {final _that = this;
switch (_that) {
case _VehicleState():
return $default(_that.isLoading,_that.vehicles,_that.errorMessage);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  List<String> vehicles,  String? errorMessage)?  $default,) {final _that = this;
switch (_that) {
case _VehicleState() when $default != null:
return $default(_that.isLoading,_that.vehicles,_that.errorMessage);case _:
  return null;

}
}

}

/// @nodoc


class _VehicleState implements VehicleState {
  const _VehicleState({this.isLoading = false, final  List<String> vehicles = const [], this.errorMessage}): _vehicles = vehicles;
  

@override@JsonKey() final  bool isLoading;
 final  List<String> _vehicles;
@override@JsonKey() List<String> get vehicles {
  if (_vehicles is EqualUnmodifiableListView) return _vehicles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_vehicles);
}

@override final  String? errorMessage;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VehicleStateCopyWith<_VehicleState> get copyWith => __$VehicleStateCopyWithImpl<_VehicleState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VehicleState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&const DeepCollectionEquality().equals(other._vehicles, _vehicles)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,const DeepCollectionEquality().hash(_vehicles),errorMessage);

@override
String toString() {
  return 'VehicleState(isLoading: $isLoading, vehicles: $vehicles, errorMessage: $errorMessage)';
}


}

/// @nodoc
abstract mixin class _$VehicleStateCopyWith<$Res> implements $VehicleStateCopyWith<$Res> {
  factory _$VehicleStateCopyWith(_VehicleState value, $Res Function(_VehicleState) _then) = __$VehicleStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, List<String> vehicles, String? errorMessage
});




}
/// @nodoc
class __$VehicleStateCopyWithImpl<$Res>
    implements _$VehicleStateCopyWith<$Res> {
  __$VehicleStateCopyWithImpl(this._self, this._then);

  final _VehicleState _self;
  final $Res Function(_VehicleState) _then;

/// Create a copy of VehicleState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? vehicles = null,Object? errorMessage = freezed,}) {
  return _then(_VehicleState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,vehicles: null == vehicles ? _self._vehicles : vehicles // ignore: cast_nullable_to_non_nullable
as List<String>,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
