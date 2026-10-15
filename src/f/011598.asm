; ---------------------------------------------------------------------------
; BigAcolyte_ActRise2 - BIGACOLYTE script action: go to height level 2 (y $3B2) and shoot there (shoot at once if already there)
; In:  8(a6) = this
; Out: d0 = +4 & 8
; Evidence: +$A0 level; BigAcolyte_SetTargetY($3B2); BigAcolyte_StateWaitYShoot
; ---------------------------------------------------------------------------
BigAcolyte_ActRise2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$2,d0
	cmp.w	$A0(a4),d0
	bne.s	loc_0115BE
	clr.w	$6C(a4)
	lea.l	BigAcolyte_StateShootAnim(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_0115E2
loc_0115BE:
	move.w	#$2,$A0(a4)
	pea.l	($3B2).w
	move.l	a4,-(a7)
	jsr	BigAcolyte_SetTargetY(pc)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	BigAcolyte_StateWaitYShoot(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0115E2:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
