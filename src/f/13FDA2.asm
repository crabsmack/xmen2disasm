; ---------------------------------------------------------------------------
; Spark_Move - free spark (rail id +$8B = 0): drift the origin +$92/+$96 by the velocity and add the wobble offset table jt $3DC2 (next entry every other frame); on a rail: Obj_RideRail (SPARK override of slot 18, +$4E; does not call the parent)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: d0 = garbage
; Evidence: method 18 of class descriptor $1400DE (name string "SPARK", parent ACTOR)
; ---------------------------------------------------------------------------
Spark_Move:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	$8B(a4)
	bne.s	loc_13FE1C
	lea.l	$3BC2(a5),a0
	movea.l	$2(a0),a3
	move.w	$9A(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a3,d0
	movea.l	d0,a0
	cmpi.w	#$100,(a0)
	blt.s	loc_13FDD2
	clr.w	$9A(a4)
loc_13FDD2:
	move.w	$9A(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	adda.l	d0,a3
	move.w	$16(a4),d0
	ext.l	d0
	add.l	d0,$92(a4)
	move.w	$18(a4),d0
	ext.l	d0
	add.l	d0,$96(a4)
	move.w	(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	$92(a4),d0
	move.l	d0,$8(a4)
	move.w	$2(a3),d0
	ext.l	d0
	lsl.l	#$8,d0
	add.l	$96(a4),d0
	move.l	d0,$C(a4)
	moveq	#$1,d0
	and.l	g_FrameCounter(a5),d0
	beq.s	loc_13FE2C
	addq.w	#$1,$9A(a4)
	bra.s	loc_13FE2C
loc_13FE1C:
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$3ECA(a5)	; -> Obj_RideRail
	addq.w	#$8,a7
loc_13FE2C:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
