; ---------------------------------------------------------------------------
; Blast_StateZap - BLAST state: every 4 frames zap the latched target (slot +$26 TakeDamage(this, 7, 1)); stop when it dies or after $1E zaps
; In:  8(a6) = this
; Out: none
; Evidence: clears the target's hit cooldown each time; end: Snd_Stop $D5, Blast_StateKill
; Found: link-after-rts
; ---------------------------------------------------------------------------
Blast_StateZap:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	$6E(a4)
	bne.s	loc_0DD0DE
	movea.l	$90(a4),a3
	move.w	#$4,$6E(a4)
	move.l	a3,d0
	beq.s	loc_0DD0BC
	moveq	#-$1,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	moveq	#$7,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	tst.w	$68(a3)
	lea.l	$18(a7),a7
	bgt.s	loc_0DD0B2
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_0DD0DE
loc_0DD0B2:
	clr.w	$6A(a3)
	andi.w	#$FFBF,$6(a3)
loc_0DD0BC:
	subq.w	#$1,$9A(a4)
	bne.s	loc_0DD0DE
	pea.l	($D5).w
	jsr	$5222(a5)	; -> Snd_Stop
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	Blast_StateKill(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0DD0DE:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
