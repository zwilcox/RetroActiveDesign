//logo loop

	LUI 63 r0	// top left most frame buffer address
	ORI 255 r0
	ADDI -106 r0	// offset 2 rows
	ADDI -2 r0		// offset 2 columns
	MOV r0 r4		// save for new row writes
	LUI 1 r1		// glyph number (315)
	ORI 59 r1
	MOVI 0 r2		// row counter
	MOVI 0 r3		// column counter
logo_column:
	CMPI 8 r2		// counter
	BEQ logo_row
	CMPI 8 r3
	BEQ draw_retro
	STOR r1 r0
	ADDI 1 r2
	ADDI -1 r0
	ADDI 1 r1
	BUC logo_column
logo_row:
	MOVI 0 r2
	ADDI -53 r4
	MOV r4 r0
	ADDI 1 r3
	BUC logo_column
	
draw_retro:
	ADDI 106 r0		// offset 2 columns
	ADDI 106 r0		// offset 2 columns
	ADDI 106 r0		// offset 2 columns
	ADDI 106 r0		// offset 2 columns
	ADDI -1 r0
	MOV r0 r4		// save for new row writes
	LUI 1 r1		// glyph number (315)
	ORI 59 r1
	MOVI 0 r2		// row counter
	MOVI 0 r3		// column counter
retro_column:
	CMPI 8 r2		// counter
	BEQ retro_row
	CMPI 8 r3
	BEQ draw_design
	STOR r1 r0
	ADDI 1 r2
	ADDI -1 r0
	ADDI 1 r1
	BUC retro_column
retro_row:
	MOVI 0 r2
	ADDI -53 r4
	MOV r4 r0
	ADDI 1 r3
	BUC retro_column
	
draw_design:
	ADDI -53 r0		// offset 2 columns
	ADDI 14 r0
	MOV r0 r4		// save for new row writes
	LUI 1 r1		// glyph number (315)
	ORI 59 r1
	MOVI 0 r2		// row counter
	MOVI 0 r3		// column counter
design_column:
	CMPI 8 r2		// counter
	BEQ retro_row
	CMPI 8 r3
	BEQ draw_design
	STOR r1 r0
	ADDI 1 r2
	ADDI -1 r0
	ADDI 1 r1
	BUC retro_column
retro_row:
	MOVI 0 r2
	ADDI -53 r4
	MOV r4 r0
	ADDI 1 r3
	BUC retro_column