; ---------------------------------------------------------------------------
; SavageBio_ActScript2052 - SAVAGE bio script action: switch to script jt[$2052] from step 0
; In:  8(a6) = this
; Out: none
; Evidence: AiScript_Set(+$96, jt[$2052]); TAS 33687
; Found: jt 991
; ---------------------------------------------------------------------------
SavageBio_ActScript2052:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1E52(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$96(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	tst.l	$98(a4)
	bne.s	loc_0BAEF0
	move.l	$64(a4),$5C(a4)
	clr.w	$6C(a4)
	bra.s	loc_0BAF0C
loc_0BAEF0:
	clr.w	$96(a4)
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	clr.w	$6C(a4)
loc_0BAF0C:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
