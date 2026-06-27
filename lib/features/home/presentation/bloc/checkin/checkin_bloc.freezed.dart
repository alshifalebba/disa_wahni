// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'checkin_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CheckinEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckinEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckinEvent()';
}


}

/// @nodoc
class $CheckinEventCopyWith<$Res>  {
$CheckinEventCopyWith(CheckinEvent _, $Res Function(CheckinEvent) __);
}


/// Adds pattern-matching-related methods to [CheckinEvent].
extension CheckinEventPatterns on CheckinEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _CaptureSelfie value)?  captureSelfie,TResult Function( _CaptureOdometer value)?  captureOdometer,TResult Function( _Submit value)?  submit,TResult Function( _Reset value)?  reset,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CaptureSelfie() when captureSelfie != null:
return captureSelfie(_that);case _CaptureOdometer() when captureOdometer != null:
return captureOdometer(_that);case _Submit() when submit != null:
return submit(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _CaptureSelfie value)  captureSelfie,required TResult Function( _CaptureOdometer value)  captureOdometer,required TResult Function( _Submit value)  submit,required TResult Function( _Reset value)  reset,}){
final _that = this;
switch (_that) {
case _CaptureSelfie():
return captureSelfie(_that);case _CaptureOdometer():
return captureOdometer(_that);case _Submit():
return submit(_that);case _Reset():
return reset(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _CaptureSelfie value)?  captureSelfie,TResult? Function( _CaptureOdometer value)?  captureOdometer,TResult? Function( _Submit value)?  submit,TResult? Function( _Reset value)?  reset,}){
final _that = this;
switch (_that) {
case _CaptureSelfie() when captureSelfie != null:
return captureSelfie(_that);case _CaptureOdometer() when captureOdometer != null:
return captureOdometer(_that);case _Submit() when submit != null:
return submit(_that);case _Reset() when reset != null:
return reset(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  captureSelfie,TResult Function()?  captureOdometer,TResult Function( String logType,  String odometerValue)?  submit,TResult Function()?  reset,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CaptureSelfie() when captureSelfie != null:
return captureSelfie();case _CaptureOdometer() when captureOdometer != null:
return captureOdometer();case _Submit() when submit != null:
return submit(_that.logType,_that.odometerValue);case _Reset() when reset != null:
return reset();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  captureSelfie,required TResult Function()  captureOdometer,required TResult Function( String logType,  String odometerValue)  submit,required TResult Function()  reset,}) {final _that = this;
switch (_that) {
case _CaptureSelfie():
return captureSelfie();case _CaptureOdometer():
return captureOdometer();case _Submit():
return submit(_that.logType,_that.odometerValue);case _Reset():
return reset();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  captureSelfie,TResult? Function()?  captureOdometer,TResult? Function( String logType,  String odometerValue)?  submit,TResult? Function()?  reset,}) {final _that = this;
switch (_that) {
case _CaptureSelfie() when captureSelfie != null:
return captureSelfie();case _CaptureOdometer() when captureOdometer != null:
return captureOdometer();case _Submit() when submit != null:
return submit(_that.logType,_that.odometerValue);case _Reset() when reset != null:
return reset();case _:
  return null;

}
}

}

/// @nodoc


class _CaptureSelfie implements CheckinEvent {
  const _CaptureSelfie();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaptureSelfie);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckinEvent.captureSelfie()';
}


}




/// @nodoc


class _CaptureOdometer implements CheckinEvent {
  const _CaptureOdometer();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CaptureOdometer);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckinEvent.captureOdometer()';
}


}




/// @nodoc


class _Submit implements CheckinEvent {
  const _Submit({required this.logType, required this.odometerValue});
  

 final  String logType;
 final  String odometerValue;

/// Create a copy of CheckinEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubmitCopyWith<_Submit> get copyWith => __$SubmitCopyWithImpl<_Submit>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Submit&&(identical(other.logType, logType) || other.logType == logType)&&(identical(other.odometerValue, odometerValue) || other.odometerValue == odometerValue));
}


@override
int get hashCode => Object.hash(runtimeType,logType,odometerValue);

@override
String toString() {
  return 'CheckinEvent.submit(logType: $logType, odometerValue: $odometerValue)';
}


}

/// @nodoc
abstract mixin class _$SubmitCopyWith<$Res> implements $CheckinEventCopyWith<$Res> {
  factory _$SubmitCopyWith(_Submit value, $Res Function(_Submit) _then) = __$SubmitCopyWithImpl;
@useResult
$Res call({
 String logType, String odometerValue
});




}
/// @nodoc
class __$SubmitCopyWithImpl<$Res>
    implements _$SubmitCopyWith<$Res> {
  __$SubmitCopyWithImpl(this._self, this._then);

  final _Submit _self;
  final $Res Function(_Submit) _then;

/// Create a copy of CheckinEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? logType = null,Object? odometerValue = null,}) {
  return _then(_Submit(
logType: null == logType ? _self.logType : logType // ignore: cast_nullable_to_non_nullable
as String,odometerValue: null == odometerValue ? _self.odometerValue : odometerValue // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Reset implements CheckinEvent {
  const _Reset();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Reset);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CheckinEvent.reset()';
}


}




/// @nodoc
mixin _$CheckinState {

 bool get isLoading; XFile? get selfieImage; XFile? get odometerImage; String? get errorMessage; String? get successMessage;
/// Create a copy of CheckinState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CheckinStateCopyWith<CheckinState> get copyWith => _$CheckinStateCopyWithImpl<CheckinState>(this as CheckinState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CheckinState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selfieImage, selfieImage) || other.selfieImage == selfieImage)&&(identical(other.odometerImage, odometerImage) || other.odometerImage == odometerImage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selfieImage,odometerImage,errorMessage,successMessage);

@override
String toString() {
  return 'CheckinState(isLoading: $isLoading, selfieImage: $selfieImage, odometerImage: $odometerImage, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class $CheckinStateCopyWith<$Res>  {
  factory $CheckinStateCopyWith(CheckinState value, $Res Function(CheckinState) _then) = _$CheckinStateCopyWithImpl;
@useResult
$Res call({
 bool isLoading, XFile? selfieImage, XFile? odometerImage, String? errorMessage, String? successMessage
});




}
/// @nodoc
class _$CheckinStateCopyWithImpl<$Res>
    implements $CheckinStateCopyWith<$Res> {
  _$CheckinStateCopyWithImpl(this._self, this._then);

  final CheckinState _self;
  final $Res Function(CheckinState) _then;

/// Create a copy of CheckinState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isLoading = null,Object? selfieImage = freezed,Object? odometerImage = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_self.copyWith(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selfieImage: freezed == selfieImage ? _self.selfieImage : selfieImage // ignore: cast_nullable_to_non_nullable
as XFile?,odometerImage: freezed == odometerImage ? _self.odometerImage : odometerImage // ignore: cast_nullable_to_non_nullable
as XFile?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CheckinState].
extension CheckinStatePatterns on CheckinState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CheckinState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CheckinState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CheckinState value)  $default,){
final _that = this;
switch (_that) {
case _CheckinState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CheckinState value)?  $default,){
final _that = this;
switch (_that) {
case _CheckinState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isLoading,  XFile? selfieImage,  XFile? odometerImage,  String? errorMessage,  String? successMessage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CheckinState() when $default != null:
return $default(_that.isLoading,_that.selfieImage,_that.odometerImage,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isLoading,  XFile? selfieImage,  XFile? odometerImage,  String? errorMessage,  String? successMessage)  $default,) {final _that = this;
switch (_that) {
case _CheckinState():
return $default(_that.isLoading,_that.selfieImage,_that.odometerImage,_that.errorMessage,_that.successMessage);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isLoading,  XFile? selfieImage,  XFile? odometerImage,  String? errorMessage,  String? successMessage)?  $default,) {final _that = this;
switch (_that) {
case _CheckinState() when $default != null:
return $default(_that.isLoading,_that.selfieImage,_that.odometerImage,_that.errorMessage,_that.successMessage);case _:
  return null;

}
}

}

/// @nodoc


class _CheckinState implements CheckinState {
  const _CheckinState({this.isLoading = false, this.selfieImage, this.odometerImage, this.errorMessage, this.successMessage});
  

@override@JsonKey() final  bool isLoading;
@override final  XFile? selfieImage;
@override final  XFile? odometerImage;
@override final  String? errorMessage;
@override final  String? successMessage;

/// Create a copy of CheckinState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CheckinStateCopyWith<_CheckinState> get copyWith => __$CheckinStateCopyWithImpl<_CheckinState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CheckinState&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.selfieImage, selfieImage) || other.selfieImage == selfieImage)&&(identical(other.odometerImage, odometerImage) || other.odometerImage == odometerImage)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&(identical(other.successMessage, successMessage) || other.successMessage == successMessage));
}


@override
int get hashCode => Object.hash(runtimeType,isLoading,selfieImage,odometerImage,errorMessage,successMessage);

@override
String toString() {
  return 'CheckinState(isLoading: $isLoading, selfieImage: $selfieImage, odometerImage: $odometerImage, errorMessage: $errorMessage, successMessage: $successMessage)';
}


}

/// @nodoc
abstract mixin class _$CheckinStateCopyWith<$Res> implements $CheckinStateCopyWith<$Res> {
  factory _$CheckinStateCopyWith(_CheckinState value, $Res Function(_CheckinState) _then) = __$CheckinStateCopyWithImpl;
@override @useResult
$Res call({
 bool isLoading, XFile? selfieImage, XFile? odometerImage, String? errorMessage, String? successMessage
});




}
/// @nodoc
class __$CheckinStateCopyWithImpl<$Res>
    implements _$CheckinStateCopyWith<$Res> {
  __$CheckinStateCopyWithImpl(this._self, this._then);

  final _CheckinState _self;
  final $Res Function(_CheckinState) _then;

/// Create a copy of CheckinState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isLoading = null,Object? selfieImage = freezed,Object? odometerImage = freezed,Object? errorMessage = freezed,Object? successMessage = freezed,}) {
  return _then(_CheckinState(
isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,selfieImage: freezed == selfieImage ? _self.selfieImage : selfieImage // ignore: cast_nullable_to_non_nullable
as XFile?,odometerImage: freezed == odometerImage ? _self.odometerImage : odometerImage // ignore: cast_nullable_to_non_nullable
as XFile?,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,successMessage: freezed == successMessage ? _self.successMessage : successMessage // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
