; ---------------------------------------------------------------------------
; Deathbird_StateHoverPause	[link-after-rts]
; ---------------------------------------------------------------------------
Deathbird_StateHoverPause:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bgt.s	loc_112BC4
	moveq	#$2,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$72(a0),a1
	jsr	(a1)
	addq.w	#$8,a7
	clr.w	$6C(a4)
	lea.l	Deathbird_StateThrowBurst(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112BD6
loc_112BC4:
	clr.w	$6C(a4)
	lea.l	Deathbird_StateHoverPause(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_112BD6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
