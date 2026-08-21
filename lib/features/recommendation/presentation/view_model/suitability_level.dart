enum SuitabilityLevel {
  veryUnsuitable,
  unsuitable,
  normal,
  recommended,
  highlyRecommended,
}

extension SuitabilityLevelFigmaLabel on SuitabilityLevel {
  String? get figmaLabel => switch (this) {
    SuitabilityLevel.veryUnsuitable => null,
    SuitabilityLevel.unsuitable => '부적합',
    SuitabilityLevel.normal => null,
    SuitabilityLevel.recommended => '적합',
    SuitabilityLevel.highlyRecommended => '매우 적합',
  };
}
