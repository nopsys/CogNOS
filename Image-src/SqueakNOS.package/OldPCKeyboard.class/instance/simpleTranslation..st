translation
simpleTranslation: scanCode
	^ TranslationTable at: scanCode + 1 ifAbsent: [Character value: 0]

