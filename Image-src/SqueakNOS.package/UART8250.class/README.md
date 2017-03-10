This is the Serial port driver. It's useful for debugging.

Usage example: 

This code will loop until it receives 100 bytes and will write them in transcript. Caution, will block everything until it finishes reading.
| s |
s := Computer current defaultSerialPort.
s open.
100 timesRepeat: [Transcript show: (s nextPut: s next)]. 