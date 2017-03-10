services
from: firstSectorNumber to: lastSectorNumber device: aDeviceNumber
	^ self at: firstSectorNumber count: lastSectorNumber - firstSectorNumber + 1 of: aDeviceNumber.