; ---------------------------------------------------------------------------
; unk_CloneA5_085932 - call the empty function sub_1203A4 (jt 606)
; In:  none
; Out: none
; Evidence: only instruction is jsr sub_1203A4, which is empty; caller sub_099016 (XCLONE area); TAS frame 52804
; Found: jt 606
; ---------------------------------------------------------------------------
unk_CloneA5_085932:
	link.w	a6,#$0
	jsr	$33EA(a5)	; -> sub_1203A4
	unlk	a6
	rts
