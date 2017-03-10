translation
shiftedTranslation: scanCode
	^ ShiftedTranslationTable at: scanCode + 1 ifAbsent: [Character value: 0]
