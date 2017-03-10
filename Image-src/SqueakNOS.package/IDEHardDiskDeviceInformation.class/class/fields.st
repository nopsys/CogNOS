as yet unclassified
fields
	"self defineFields"
	^#(
		(configuration		'short')		" 0 "
		(cylindersDefault	'short')
		(specific			'short')
		(headsDefault		'short')
		(nil					'long')		" 4-5 "
		(sectorsDefault		'short')		" 6 "
		(nil					'long')		" 7-8 "
		(nil					'short')		" 9 "
		(serial				'string' 20)	" 10-19 "
		(nil					'long')		" 20-21 "
		(nil					'short')
		(version			'string' 8)	" 23-26 "
		(model				'string' 40)	" 27-46 "
		(sectorsMultipleMax	'short')		" 47 "
		(nil					'short')
		(capabilities			'long')
		(nil					'long')
		(validity			'short')		" 53 "
		(cylindersCurrent	'short')
		(headsCurrent		'short')
		(sectorsCurrent		'short')
		(totalSectorsCurrent	'long')
		(sectorsMultiple		'short')
		(sectors				'long')		" 60-61 "
		(nil					'short')
		(multiwordDMAtransfer		'short')
		(pioMode			'short')
		(minMultiwordDMAtime	'short')

	)