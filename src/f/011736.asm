; ---------------------------------------------------------------------------
; BigAcolyte_ActGoLowShoot - BIGACOLYTE script action: head for y $3F2 while shooting every 3 frames
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$A0 = 0; BigAcolyte_SetTargetY($3F2); BigAcolyte_StateShootAnim after 3
; ---------------------------------------------------------------------------
BigAcolyte_ActGoLowShoot:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	clr.w	$A0(a4)
	pea.l	($3F2).w
	move.l	a4,-(a7)
	jsr	BigAcolyte_SetTargetY(pc)
	addq.w	#$8,a7
	move.w	#$3,$6C(a4)
	lea.l	BigAcolyte_StateShootAnim(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
