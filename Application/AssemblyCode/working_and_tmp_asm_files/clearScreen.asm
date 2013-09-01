JAL r6 clearscreen
BUC 0

// uses r2, r3, r4
clearscreen:
	LUI 63 r2	
	ORI 255 r2	# r2 is current fb index
	LUI	55 r3
	ORI 183 r3	# r3 is last square outside of fp
	MOVI 1 r4   # load fb with glyph 0
	loop:
	CMP	r3 r2
	BEQ endloop
	STOR r4 r2
	ADDI -1 r2
	BUC loop
	endloop:
	RETX