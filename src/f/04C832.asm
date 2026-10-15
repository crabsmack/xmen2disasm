; ---------------------------------------------------------------------------
; Apocalypse_Draw - copy the body's h-flip to the second sprite, then Spr_Draw the body (+$2E) and the second sprite (+$92) at the camera-relative position, each unless its frame is $FF (APOCALYPSE override of slot +$1A Draw; no hit blink, does not call the parent)
; In:  8(a6) = this (APOCALYPSE object)
; Out: none
; Evidence: class descriptor APOCALYPSE slot +$1A (tools/classes.py); TAS frames 24087-27244 (3157 active)
; ---------------------------------------------------------------------------
Apocalypse_Draw:
	link.w	a6,#$FFFC
	movem.l	d3/d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	movea.l	$92(a4),a3
	lea.l	$2E(a4),a0
	move.l	a0,-$4(a6)
	movea.l	-$4(a6),a0
	moveq	#$10,d0
	and.b	(a0),d0
	moveq	#$0,d1
	move.b	d0,d1
	moveq	#-$11,d0
	and.b	(a3),d0
	ext.w	d0
	or.w	d1,d0
	move.b	d0,(a3)
	movea.l	-$4(a6),a0
	moveq	#$0,d0
	move.b	$1(a0),d0
	cmpi.w	#$FF,d0
	beq.w	loc_04C91A
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_04C892
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_04C892
	moveq	#$1,d3
loc_04C892:
	tst.b	d3
	beq.s	loc_04C8AE
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraY(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_04C8BE
loc_04C8AE:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_04C8BE:
	move.l	d1,-(a7)
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_04C8E0
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_04C8E0
	moveq	#$1,d3
loc_04C8E0:
	tst.b	d3
	beq.s	loc_04C8FC
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraX(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_04C90C
loc_04C8FC:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_04C90C:
	move.l	d1,-(a7)
	move.l	-$4(a6),-(a7)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$C(a7),a7
loc_04C91A:
	moveq	#$0,d0
	move.b	$1(a3),d0
	cmpi.w	#$FF,d0
	beq.w	loc_04C9CE
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_04C948
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$30,d0
	bne.s	loc_04C948
	moveq	#$1,d3
loc_04C948:
	tst.b	d3
	beq.s	loc_04C964
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$C(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraY(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_04C974
loc_04C964:
	move.l	$C(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraY(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_04C974:
	move.l	d1,-(a7)
	moveq	#$0,d3
	tst.l	$44(a4)
	beq.s	loc_04C996
	movea.l	$44(a4),a0
	moveq	#$0,d0
	move.b	(a0),d0
	moveq	#$30,d1
	and.b	d0,d1
	moveq	#$0,d0
	move.b	d1,d0
	cmpi.w	#$20,d0
	bne.s	loc_04C996
	moveq	#$1,d3
loc_04C996:
	tst.b	d3
	beq.s	loc_04C9B2
	move.w	$4A(a4),d0
	ext.l	d0
	move.l	$8(a4),d1
	sub.l	d0,d1
	asr.l	#$8,d1
	move.w	g_CameraX(a5),d0
	ext.l	d0
	sub.l	d0,d1
	bra.s	loc_04C9C2
loc_04C9B2:
	move.l	$8(a4),d0
	asr.l	#$8,d0
	move.w	g_CameraX(a5),d1
	ext.l	d1
	sub.l	d1,d0
	move.l	d0,d1
loc_04C9C2:
	move.l	d1,-(a7)
	move.l	a3,-(a7)
	jsr	$508A(a5)	; -> Spr_Draw
	lea.l	$C(a7),a7
loc_04C9CE:
	movem.l	-$14(a6),d3/d7/a3-a4
	unlk	a6
	rts
