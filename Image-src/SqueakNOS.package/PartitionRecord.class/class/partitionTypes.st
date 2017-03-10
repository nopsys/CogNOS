as yet unclassified
partitionTypes
	"source:
	http://home.teleport.com/~brainy/fat32.htm and
	http://www.win.tue.nl/~aeb/partitions/partition_types-1.html"
	
	| types |
	types := Dictionary new.
	types at: 16r00 put: #Unknown;
		at: 16r01 put: #FAT12;
		at: 16r04 put: #FAT16; "16-bit FAT (Partition Smaller than 32MB)"
		at: 16r05 put: #ExtendedMSDOS;
		at: 16r06 put: #FAT16Large; "16-bit FAT (Partition Larger than 32MB)"
		at: 16r0B put: #FAT32; "32-bit FAT (Partition Up to 2048GB)"
		at: 16r0C put: #FAT32LBA; "Same as 0BH, but uses LBA1 13h Extensions"
		at: 16r0E put: #FAT16LargeLBA; "Same as 06H, but uses LBA1 13h Extensions"
		at: 16r0F put: #ExtendedMSDOSLBA; "Same as 05H, but uses LBA1 13h Extensions"
		at: 16r83 put: #Linux. "Various filesystem types like xiafs, ext2, ext3, reiserfs, etc. all use ID 83".
		
	^types.