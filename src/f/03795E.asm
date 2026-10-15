; ---------------------------------------------------------------------------
; MagnetoBoss_StateShootRecover - MAGNETOBOSS: recover pose for the shot direction, then return to the resume state +$90
; In:  8(a6) = this
; Out: none
; Evidence: sub_159138(dir) animation
; ---------------------------------------------------------------------------
MagnetoBoss_StateShootRecover:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$0,d0
	move.b	$9C(a4),d0
	move.l	d0,-(a7)
	jsr	$3E32(a5)	; -> sub_159138
	movea.l	d0,a3
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	tst.l	$90(a4)
	beq.s	loc_037992
	move.l	$90(a4),$5C(a4)
	move.w	#$FF,$6C(a4)
loc_037992:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
