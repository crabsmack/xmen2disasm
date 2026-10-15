; ---------------------------------------------------------------------------
; sub_112BDE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_112BDE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.l	$44(a4)
	beq.s	loc_112C02
	clr.w	$6C(a4)
	lea.l	sub_112BDE(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_112C48
loc_112C02:
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$6E(a0),a1
	jsr	(a1)
	move.l	$9E(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	pea.l	($FC).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($FC).w
	jsr	$521A(a5)	; -> Snd_Play
	lea.l	$2ADA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> sub_1F6296
	lea.l	$18(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_112C50(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_112C48:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
