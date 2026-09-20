enum SuitabilityLevel {
  veryUnsuitable,
  unsuitable,
  normal,
  recommended,
  highlyRecommended,
}

SuitabilityLevel? suitabilityLevelFromApi(String raw) => switch (raw) {
  'VERY_UNSUITABLE' => SuitabilityLevel.veryUnsuitable,
  'UNSUITABLE' => SuitabilityLevel.unsuitable,
  'NORMAL' => SuitabilityLevel.normal,
  'RECOMMENDED' => SuitabilityLevel.recommended,
  'HIGHLY_RECOMMENDED' => SuitabilityLevel.highlyRecommended,
  _ => null,
};

extension SuitabilityLevelFigmaLabel on SuitabilityLevel {
  String? get figmaLabel => switch (this) {
    SuitabilityLevel.veryUnsuitable => null,
    SuitabilityLevel.unsuitable => '부적합',
    SuitabilityLevel.normal => null,
    SuitabilityLevel.recommended => '적합',
    SuitabilityLevel.highlyRecommended => '매우 적합',
  };
}
