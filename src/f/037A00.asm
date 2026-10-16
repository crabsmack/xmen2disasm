; ---------------------------------------------------------------------------
; MagnetoBoss_StateOutroLoop - MAGNETOBOSS outro: keep setting animation Tbl_MagnetoBossAnim17 (jt $4752)
; In:  8(a6) = this
; Out: none
; Evidence: single Obj_ChangeAnim call
; ---------------------------------------------------------------------------
MagnetoBoss_StateOutroLoop:
	link.w	a6,#$0
	lea.l	$4752(a5),a0
	move.l	$2(a0),-(a7)
	move.l	$8(a6),-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	unlk	a6
	rts
