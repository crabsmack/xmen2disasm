; ---------------------------------------------------------------------------
; PerimeterDoor_StateWaitExit - PERIMETERDOOR state: when a player stands within 16 px of the opening, end the scene after 10 frames
; In:  8(a6) = this
; Out: d0
; Evidence: Scene_EndAfter(10) (scene exit timer); next PerimeterDoor_StateDone; TAS 31892-33089
; Found: link-after-rts
; ---------------------------------------------------------------------------
PerimeterDoor_StateWaitExit:
	link.w	a6,#$0
	movem.l	d3-d7/a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$8(a4),d0
	sub.l	-$1750(a5),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AD084
	move.l	$8(a4),d0
	sub.l	-$1750(a5),d0
	bra.s	loc_0AD08E
loc_0AD084:
	move.l	$8(a4),d0
	sub.l	-$1750(a5),d0
	neg.l	d0
loc_0AD08E:
	move.l	d0,d4
	asr.l	#$8,d4
	move.l	$C(a4),d0
	add.l	#$3000,d0
	sub.l	-$174C(a5),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AD0B6
	move.l	$C(a4),d0
	add.l	#$3000,d0
	sub.l	-$174C(a5),d0
	bra.s	loc_0AD0C6
loc_0AD0B6:
	move.l	$C(a4),d0
	add.l	#$3000,d0
	sub.l	-$174C(a5),d0
	neg.l	d0
loc_0AD0C6:
	move.l	d0,d5
	asr.l	#$8,d5
	move.l	$8(a4),d0
	sub.l	-$1840(a5),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AD0E2
	move.l	$8(a4),d0
	sub.l	-$1840(a5),d0
	bra.s	loc_0AD0EC
loc_0AD0E2:
	move.l	$8(a4),d0
	sub.l	-$1840(a5),d0
	neg.l	d0
loc_0AD0EC:
	move.l	d0,d6
	asr.l	#$8,d6
	move.l	$C(a4),d0
	add.l	#$3000,d0
	sub.l	-$183C(a5),d0
	sge.b	d3
	neg.b	d3
	beq.s	loc_0AD114
	move.l	$C(a4),d0
	add.l	#$3000,d0
	sub.l	-$183C(a5),d0
	bra.s	loc_0AD124
loc_0AD114:
	move.l	$C(a4),d0
	add.l	#$3000,d0
	sub.l	-$183C(a5),d0
	neg.l	d0
loc_0AD124:
	move.l	d0,d7
	asr.l	#$8,d7
	cmpi.w	#$10,d4
	bge.s	loc_0AD134
	cmpi.w	#$10,d5
	blt.s	loc_0AD140
loc_0AD134:
	cmpi.w	#$10,d6
	bge.s	loc_0AD15C
	cmpi.w	#$10,d7
	bge.s	loc_0AD15C
loc_0AD140:
	moveq	#$A,d0
	move.l	d0,-(a7)
	jsr	$4F8A(a5)	; -> Scene_EndAfter
	addq.w	#$4,a7
	clr.w	$6C(a4)
	lea.l	PerimeterDoor_StateDone(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0AD15C:
	movem.l	-$18(a6),d3-d7/a4
	unlk	a6
	rts
