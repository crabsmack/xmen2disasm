; ---------------------------------------------------------------------------
; SiberiaB1_PreLoad - SiberiaB1 scene pre-load hook: set stage flags, then the standard Scene_PreLoadReset
; In:  none
; Out: none
; Evidence: installed in $FFC918 (-$38E8, called first by the scene loader sub_1F98A8)
; ---------------------------------------------------------------------------
SiberiaB1_PreLoad:
	link.w	a6,#$0
	clr.b	-$13F0(a5)
	move.b	#$1,-$13EE(a5)
	move.b	#$1,-$3BBA(a5)
	jsr	$7A(a5)	; -> Scene_PreLoadReset
	unlk	a6
	rts
