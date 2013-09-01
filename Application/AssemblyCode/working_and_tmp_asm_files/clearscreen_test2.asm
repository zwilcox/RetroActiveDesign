LUI 63 r2	
ORI 255 r2	// r2 is current fb index
LUI	55 r3
ORI 183 r3	// r3 is last square outside of fp
MOVI 1 r4   // load fb with glyph 0
compare:
CMP	r2 r3
BEQ end
STOR r4 r2
ADDI -1 r2
JUC r9 compare
end:
LUI 63 r2	
ORI 255 r2	// r2 is current fb index
LUI	55 r3
ORI 130 r3	// r3 is last square outside of fp
MOVI 15 r4   // load fb with glyph 0
compare2:
CMP	r2 r3
BEQ end1
STOR r4 r2
ADDI -1 r2
JUC r9 compare2
end1:

