; ---------------------------------------------------------------------------
; BroodBossWall_Update - BROODBOSSWALL Update (ICANDY slot +$12): keep a $C0-tall solid box and move with +$14; when destroyed, explode up the wall and remove itself
; In:  8(a6) = this
; Out: none
; Evidence: +$43 = 0: creates the solid rectangle Seg_Create($14, 0, x-8, y-$C0, x+$10, y) -> +$44, x += +$14 and shifts the box; else frees the box (Seg_Free), 6 x Debris_Spawn explosions every $20 px upward, sound $35, ICANDY +$1A; TAS 50319-50484
; Found: jt 618
; ---------------------------------------------------------------------------
BroodBossWall_Update:
	link.w	a6,#$0
	movem.l	d3/d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$43(a4)
	beq.s	loc_0860B8
	tst.l	$44(a4)
	beq.s	loc_08605A
	move.l	$44(a4),-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	moveq	#$0,d0
	move.l	d0,$44(a4)
	addq.w	#$4,a7
loc_08605A:
	move.l	$8(a4),d5
	asr.l	#$8,d5
	move.l	$C(a4),d6
	asr.l	#$8,d6
	clr.w	d7
loc_086068:
	moveq	#$3,d0
	move.l	d0,-(a7)
	move.l	-$3B1C(a5),-(a7)
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,-(a7)
	jsr	$3B6A(a5)	; -> Debris_Spawn
	lea.l	$10(a7),a7
	move.w	d7,d0
	addq.w	#$1,d7
	subi.w	#$20,d6
	cmpi.w	#$6,d7
	blt.s	loc_086068
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$35,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.l	a4,-(a7)
	lea.l	$14F2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$1A(a0),a1
	jsr	(a1)
	lea.l	$C(a7),a7
	bra.s	loc_08612C
loc_0860B8:
	move.l	$8(a4),d5
	asr.l	#$8,d5
	move.l	$C(a4),d6
	asr.l	#$8,d6
	tst.l	$44(a4)
	bne.s	loc_086100
	ext.l	d6
	move.l	d6,-(a7)
	ext.l	d5
	move.l	d5,d0
	moveq	#$10,d1
	add.l	d1,d0
	move.l	d0,-(a7)
	ext.l	d6
	move.l	d6,d0
	sub.l	#$C0,d0
	move.l	d0,-(a7)
	ext.l	d5
	move.l	d5,d0
	subq.l	#$8,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$14,d1
	move.l	d1,-(a7)
	jsr	$4F1A(a5)	; -> Seg_Create
	move.l	d0,$44(a4)
	lea.l	$18(a7),a7
loc_086100:
	move.w	$14(a4),d0
	ext.l	d0
	add.l	d0,$8(a4)
	tst.l	$44(a4)
	beq.s	loc_08612C
	movea.l	$44(a4),a0
	move.w	$14(a4),d0
	asr.w	#$8,d0
	add.w	d0,$8(a0)
	movea.l	$44(a4),a0
	move.w	$14(a4),d0
	asr.w	#$8,d0
	add.w	d0,$C(a0)
loc_08612C:
	movem.l	-$14(a6),d3/d5-d7/a4
	unlk	a6
	rts
