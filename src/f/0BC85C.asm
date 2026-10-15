; ---------------------------------------------------------------------------
; SavageBio_StateDying - SAVAGE bio state: dying - switch to the death script jt[$2042]
; In:  8(a6) = this
; Out: none
; Evidence: set by SavageBigBio_TakeDamage at 0 health; TAS 33891
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageBio_StateDying:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1E42(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	bne.s	loc_0BC888
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BC8A4
loc_0BC888:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BC8A4:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
