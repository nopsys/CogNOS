initialization
parseVendorsAndDevicesFromPCIIDsDatabase: strm
	" The csv file was downloaded from http://pci-ids.ucw.cz/  "
	"# Syntax:
	# vendor  vendor_name
	#	device  device_name				<-- single tab
	#		subvendor subdevice  subsystem_name	<-- two tabs
	"

	| vendors tok vendorId subId deviceId description |
	vendors := Dictionary new.
	[strm atEnd] whileFalse: [
		tok := strm peek.
		tok == Character tab
			ifTrue: [	" starts with tab "
				strm next.
				tok := strm peek.
				tok == Character tab
					ifTrue: [	"#		subvendor subdevice  subsystem_name"
						strm next.
						subId := strm upTo: Character space.
						strm skipSeparators.
						subId := subId, (strm upTo: Character space).
						strm upTo: Character lf.
					] ifFalse: [	"#	device  device_name"
						deviceId := (strm upTo: Character space) asUppercase.
						deviceId := Number readFrom: deviceId base: 16.
						strm skipSeparators.
						description := strm upTo: Character lf.
						vendors at: vendorId << 32 + deviceId put: description.
					]
			] ifFalse: [	" doesn't start with tab "
				tok == $C
					ifTrue: [	" device classes, not supported yet. Assume end "
						strm setToEnd.
					] ifFalse: [
						(tok == $# or: [tok == Character lf])
							ifTrue: [strm upTo: Character lf]
							ifFalse: [ "# vendorId vendor name "
								vendorId := (strm upTo: Character space) asUppercase.
								vendorId := Number readFrom: vendorId base: 16.
								strm skipSeparators.
								description := strm upTo: Character lf.
								vendors at: vendorId put: description.
							]
					]
			]
	].

	^ vendors