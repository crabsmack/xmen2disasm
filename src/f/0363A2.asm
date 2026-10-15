; ---------------------------------------------------------------------------
; MagnetoBoss_Update - parent Update, then unless +4 bit $10: count down +$AC (2 per frame in two-player step), every 60 frames re-pick the nearest live player (Player_NearestLive) into +$8C, face it when +$9B bit 4 and not in hit cooldown, and restart animation jt $4672 when none plays (MAGNETOBOSS override of slot +$4A Update)
; In:  8(a6) = this (MAGNETOBOSS object)
; Out: none
; Evidence: class descriptor MAGNETOBOSS slot +$4A (tools/classes.py); TAS frames 18543-20031 (1363 active)
; ---------------------------------------------------------------------------
MagnetoBoss_Update:
	link.w	a6,#$0
	movem.l	d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0363B8
	moveq	#$2,d0
	bra.s	loc_0363BA
loc_0363B8:
	moveq	#$1,d0
loc_0363BA:
	move.w	d0,d7
	move.l	a4,-(a7)
	lea.l	$772(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	moveq	#$10,d0
	and.w	$4(a4),d0
	addq.w	#$4,a7
	bne.s	loc_036452
loc_0363DA:
	tst.w	$AC(a4)
	beq.s	loc_0363EE
	subq.w	#$1,$AC(a4)
	tst.w	$AC(a4)
	bge.s	loc_0363EE
	clr.w	$AC(a4)
loc_0363EE:
	subq.w	#$1,d7
	bne.s	loc_0363DA
	tst.w	$6E(a4)
	bne.s	loc_03640A
	move.l	a4,-(a7)
	jsr	$4EB2(a5)	; -> Player_NearestLive
	move.l	d0,$8C(a4)
	move.w	#$3C,$6E(a4)
	addq.w	#$4,a7
loc_03640A:
	moveq	#$0,d0
	move.b	$9B(a4),d0
	moveq	#$10,d1
	and.b	d0,d1
	beq.s	loc_03643C
	movea.l	$8C(a4),a3
	move.l	a3,d0
	beq.s	loc_03643C
	tst.w	$6A(a4)
	bne.s	loc_03643C
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_036436
	ori.b	#$10,$2E(a4)
	bra.s	loc_03643C
loc_036436:
	andi.b	#$EF,$2E(a4)
loc_03643C:
	tst.l	$44(a4)
	bne.s	loc_036452
	lea.l	$4672(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E4A(a5)	; -> Obj_ChangeAnim
	addq.w	#$8,a7
loc_036452:
	movem.l	-$C(a6),d7/a3-a4
	unlk	a6
	rts
