First reference is this:

http://www.repairfaq.org/filipg/LINK/F_IDE-tech.html

But it contains some errors/simplifications, particularly about LBA addressing, so I recomend
reading this too:

http://www.t13.org/Documents/UploadedDocuments/project/d0791r4c-ATA-1.pdf

ATA Specification defines a set of registers that are used to communicate with a hard disk controller. Each controller controls at most two hard disks: a master and a slave. Most
commands issued in these registers apply to the controller's selected disk (master or slave).

+----+------+------+---+---+---+----------------+---------------+
|Addr|-CS1FX|-CS3FX|SA2|SA1|SA0| Read (-IOR)    | Write (-IOW)  |
+----+------+------+---+---+---+----------------+---------------+-----------+
|    |  0   |  0   | X | X | X | ILLEGAL        | ILLEGAL       | <--+      |
|    |  1   |  1   | X | X | X | High Impedance | Not Used      | Control   |
|3FX |  1   |  0   | 0 | X | X | High Impedance | Not Used      | Block     |
|3FX |  1   |  0   | 1 | 0 | X | High Impedance | Not Used      | Registers |
|3F6 |  1   |  0   | 1 | 1 | 0 | Altern Status  | Device Control|    |      |
|3F7 |  1   |  0   | 1 | 1 | 1 | Drive Address  | Not Used      | <--+      |
+----+------+------+---+---+---+----------------+---------------+-----------+
|1F0 |  0   |  1   | 0 | 0 | 0 | Data Port      | Data Port     | <--+      |
|1F1 |  0   |  1   | 0 | 0 | 1 | Error Register | Features       |    |      |
|1F2 |  0   |  1   | 0 | 1 | 0 | Sector Count   | Sector Count  | Command   |
|1F3 |  0   |  1   | 0 | 1 | 1 | Sector Number  | Sector Number | Block     |
|1F4 |  0   |  1   | 1 | 0 | 0 | Cylinder Low   | Cylinder Low  | Registers |
|1F5 |  0   |  1   | 1 | 0 | 1 | Cylinder High  | Cylinder High |    |      |
|1F6 |  0   |  1   | 1 | 1 | 0 | Drive / Head   | Drive / Head  |    |      |
|1F7 |  0   |  1   | 1 | 1 | 1 | Status         | Command       | <--+      |
+----+------+------+---+---+---+----------------+---------------+-----------+

1F0: Read/Write: DATA PORT REGISTER
1F1: Read: ERROR REGISTER
1F1: Write: FEATURES
1F2: Read/Write: SECTOR COUNT REGISTER
1F3: Read/Write: SECTOR NUMBER REGISTER
1F4: Read/Write: CYLINDER LOW REGISTER
1F5: Read/Write: CYLINDER HIGH REGISTER
1F6: Read/Write: DRIVE/HEAD REGISTER (rrrDHHHH)
1F7: Read: STATUS REGISTER
1F7: Write: COMMAND REGISTER

	mov     dx,1f6h         ;Drive and head port
	mov     al,0a0h         ;Drive 0, head 0
	out     dx,al

	mov     dx,1f2h         ;Sector count port
	mov     al,1            ;Read one sector
	out     dx,al

	mov     dx,1f3h         ;Sector number port
	mov     al,1            ;Read sector one
	out     dx,al

	mov     dx,1f4h         ;Cylinder low port
	mov     al,0            ;Cylinder 0
	out     dx,al

	mov     dx,1f5h         ;Cylinder high port
	mov     al,0            ;The rest of the cylinder 0
	out     dx,al

	mov     dx,1f7h         ;Command port
	mov     al,20h          ;Read with retry.
	out     dx,al
still_going:
	in      al,dx
	test    al,8            ;This means the sector buffer requires