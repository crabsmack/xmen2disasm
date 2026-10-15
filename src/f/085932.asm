; ---------------------------------------------------------------------------
; unk_CloneA5_085932 - call the empty function BioBalls_EmptyStub (jt 606)
; In:  none
; Out: none
; Evidence: only instruction is jsr BioBalls_EmptyStub, which is empty; caller XClone_StartMakerMode (XCLONE area); TAS frame 52804
; Found: jt 606
; ---------------------------------------------------------------------------
unk_CloneA5_085932:
	link.w	a6,#$0
	jsr	$33EA(a5)	; -> BioBalls_EmptyStub
	unlk	a6
	rts
