; ---------------------------------------------------------------------------
; BigAcolyte_ActGoTop - BIGACOLYTE script action: go to level 0 (y $31A) and shoot when there
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$A0 = 0; BigAcolyte_SetTargetY($31A); BigAcolyte_StateWaitYShoot
; ---------------------------------------------------------------------------
BigAcolyte_ActGoTop:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$A0(a4)
	pea.l	($31A).w
	move.l	a4,-(a7)
	jsr	BigAcolyte_SetTargetY(pc)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	BigAcolyte_StateWaitYShoot(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
