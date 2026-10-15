; ---------------------------------------------------------------------------
; BioSentinel_TakeDamage - hits only count while vulnerable (+$A6 set): psychic hits (types $D-$F) go to the parent (stun); others play sound 99, health -= damage, face away from the hit (type 9/10), cooldown 40 and switch at once to the hurt state +$60 (BIOSENTINEL override of slot 8, +$26; no OnHurt/OnDeath)
; In:  8(a6) = this  $C(a6) = attacker  $13(a6) = byte hit type  $17(a6) = byte damage  $1A/$1E(a6) = words
; Out: none
; Evidence: method 8 of class descriptor $1235F6 (name string "BIOSENTINEL", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BioSentinel_TakeDamage:
	link.w	a6,#$0
	movem.l	d6-d7/a4,-(a7)
	move.b	$17(a6),d6
	move.b	$13(a6),d7
	movea.l	$8(a6),a4
	tst.b	$A6(a4)
	beq.w	loc_12155C
	move.b	d7,d0
	subi.b	#$D,d0
	beq.s	loc_1214DE
	subq.b	#$1,d0
	beq.s	loc_1214DE
	subq.b	#$1,d0
	bne.s	loc_121518
loc_1214DE:
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	ext.w	d6
	ext.l	d6
	move.l	d6,-(a7)
	ext.w	d7
	ext.l	d7
	move.l	d7,-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3572(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	lea.l	$18(a7),a7
	bra.s	loc_12155C
loc_121518:
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	ext.w	d6
	sub.w	d6,$68(a4)
	move.b	d7,d0
	subi.b	#$9,d0
	addq.w	#$8,a7
	beq.s	loc_12153E
	subq.b	#$1,d0
	beq.s	loc_121546
	bra.s	loc_12154C
loc_12153E:
	andi.b	#$EF,$2E(a4)
	bra.s	loc_12154C
loc_121546:
	ori.b	#$10,$2E(a4)
loc_12154C:
	move.w	#$28,$6A(a4)
	move.l	$60(a4),$5C(a4)
	clr.w	$6C(a4)
loc_12155C:
	movem.l	-$C(a6),d6-d7/a4
	unlk	a6
	rts
