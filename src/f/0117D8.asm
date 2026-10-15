; ---------------------------------------------------------------------------
; BigAcolyte_ActGoLow1 - BIGACOLYTE script action: go to level 1 (y $412), then the next step
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$A0 = 1; BigAcolyte_SetTargetY($412); BigAcolyte_StateWaitYNext
; ---------------------------------------------------------------------------
BigAcolyte_ActGoLow1:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$1,$A0(a4)
	pea.l	($412).w
	move.l	a4,-(a7)
	jsr	BigAcolyte_SetTargetY(pc)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	BigAcolyte_StateWaitYNext(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
