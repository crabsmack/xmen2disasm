; ---------------------------------------------------------------------------
; LaserCannon_StateFire - LaserCannon state: fire one diagonal gauss shot (sound $F3); repeat after +$A0 until the burst is spent, then retract
; In:  8(a6) = this
; Out: d0 = flags & 8
; Evidence: SetFrame(3); GaussBullet_Fire(x +/-30 px, y -27 px (+27 when v-flipped), 0, +/-30, -/+27, flags $A); Snd_Stop/Snd_Play($F3); +$9A -= 1: 0 -> +$6C = 15, LaserCannon_StateRetract, else +$6C = +$A0 (spawn +$C, default 40) -> LaserCannon_StateAim; TAS 10880-13095
; ---------------------------------------------------------------------------
LaserCannon_StateFire:
	link.w	a6,#$FFFC
	movem.l	d4-d7/a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	$8(a4),-$4(a6)
	move.l	$C(a4),d4
	moveq	#$1E,d6
	moveq	#-$1B,d7
	moveq	#$4,d0
	and.b	$2E(a4),d0
	beq.s	loc_1385F0
	move.l	#$8000,d0
	bra.s	loc_1385F2
loc_1385F0:
	moveq	#$0,d0
loc_1385F2:
	move.l	d0,d5
	moveq	#$8,d0
	and.b	$2E(a4),d0
	addq.w	#$8,a7
	beq.s	loc_138606
	ext.l	d7
	move.l	d7,d0
	neg.l	d0
	move.w	d0,d7
loc_138606:
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_13861C
	ext.l	d6
	move.l	d6,d0
	neg.l	d0
	move.w	d0,d6
	ori.l	#$800,d5
loc_13861C:
	ext.l	d6
	move.l	d6,d0
	lsl.l	#$8,d0
	add.l	d0,-$4(a6)
	ext.l	d7
	move.l	d7,d0
	lsl.l	#$8,d0
	add.l	d0,d4
	ori.l	#$A,d5
	move.l	d5,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d4,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$2E92(a5)	; -> GaussBullet_Fire
	pea.l	($F3).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($F3).w
	jsr	$521A(a5)	; -> Snd_Play
	subq.w	#$1,$9A(a4)
	lea.l	$20(a7),a7
	beq.s	loc_138696
	moveq	#-$1,d0
	cmp.w	$A0(a4),d0
	bne.s	loc_138680
	lea.l	LaserCannon_StateAim(pc),a0
	move.l	a0,$5C(a4)
	move.l	a4,-(a7)
	jsr	LaserCannon_StateAim(pc)
	addq.w	#$4,a7
	bra.s	loc_1386AA
loc_138680:
	move.w	$A0(a4),$6C(a4)
	lea.l	LaserCannon_StateAim(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	bra.s	loc_1386AA
loc_138696:
	move.w	#$F,$6C(a4)
	lea.l	LaserCannon_StateRetract(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_1386AA:
	movem.l	-$18(a6),d4-d7/a4
	unlk	a6
	rts
