; ---------------------------------------------------------------------------
; Scene_PreLoadReset - scene-load pre hook: clear the ten 14-byte slots at $FFE4C0 and the table set by sub_118760, reset a few scene values
; In:  none
; Out: none
; Evidence: installed in -$38E8 by Game_SceneLoop, called at the start of scene load sub_1F98A8; sub_118042 + sub_118760(0,0,0); e4be=$7A1, e4bc=$5F, e4ba=$700 (meaning unknown)
; ---------------------------------------------------------------------------
Scene_PreLoadReset:
	link.w	a6,#$0
	jsr	$2DC2(a5)	; -> sub_118042
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$2E2A(a5)	; -> sub_118760
	move.w	#$7A1,-$1D42(a5)
	move.w	#$5F,-$1D44(a5)
	move.w	#$700,-$1D46(a5)
	moveq	#$0,d0
	move.l	d0,-$1CA6(a5)
	move.l	d0,-$1CA2(a5)
	clr.w	-$3AFA(a5)
	unlk	a6
	rts
