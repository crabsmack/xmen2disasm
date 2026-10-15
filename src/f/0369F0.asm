; ---------------------------------------------------------------------------
; MagnetoBoss_CrackWall - crack the wall tiles of a column one stage ($8C -> $A9 -> $AA -> $AB -> $AC), or straight to $AC; sound 99
; In:  8(a6) = word column, $C(a6) = word first row, $10(a6) = word last row, $14(a6) = byte instant
; Out: d0 = 1 when the wall is fully cracked
; Evidence: Map_SetBlockFG per row; callers the intro states and MagnetoBoss_StateBreakWall
; ---------------------------------------------------------------------------
MagnetoBoss_CrackWall:
	link.w	a6,#$0
	movem.l	d4-d7,-(a7)
	clr.b	d4
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,d6
	bra.w	loc_036A9C
loc_036A06:
	movea.l	-$3A72(a5),a0
	move.l	d6,d0
	add.l	d0,d0
	move.w	(a0,d0.l),d0
	ext.l	d0
	move.w	$A(a6),d1
	ext.l	d1
	add.l	d0,d1
	movea.l	-$3A84(a5),a0
	add.l	d1,d1
	move.w	#$1FF,d0
	and.w	(a0,d1.l),d0
	moveq	#$0,d5
	move.w	d0,d5
	tst.l	d5
	tst.b	$17(a6)
	beq.s	loc_036A40
	move.l	#$AC,d7
	moveq	#$1,d4
	bra.s	loc_036A80
loc_036A40:
	cmpi.l	#$8C,d5
	bne.s	loc_036A50
	move.l	#$A9,d7
	bra.s	loc_036A80
loc_036A50:
	cmpi.l	#$A9,d5
	bne.s	loc_036A60
	move.l	#$AA,d7
	bra.s	loc_036A80
loc_036A60:
	cmpi.l	#$AA,d5
	bne.s	loc_036A70
	move.l	#$AB,d7
	bra.s	loc_036A80
loc_036A70:
	cmpi.l	#$AB,d5
	bne.s	loc_036A80
	move.l	#$AC,d7
	moveq	#$1,d4
loc_036A80:
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	move.w	$A(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	jsr	$3FDA(a5)	; -> Map_SetBlockFG
	lea.l	$10(a7),a7
	move.l	d6,d0
	addq.l	#$1,d6
loc_036A9C:
	move.w	$12(a6),d0
	ext.l	d0
	cmp.l	d6,d0
	bge.w	loc_036A06
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$63,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.b	d4,d0
	addq.w	#$8,a7
	movem.l	-$10(a6),d4-d7
	unlk	a6
	rts
