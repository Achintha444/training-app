import 'package:flutter/material.dart';

@immutable
class RootState {
  final String error;
  final bool initialized;

  RootState({
    @required this.initialized,
    @required this.error,
  });

  static RootState get initialState => RootState(
    error: '',
    initialized: false,
  );

  RootState clone({
    String error,
    bool initialzied,
  }) {
    return RootState(
      error: error ?? this.error,
      initialized: initialzied ?? this.initialized,
    );
  }
}
