; ---------------------------------------------------------------------------
; CapedAcolyte_ActFacePlayer - CAPEDACOLYTE script action: face the nearest player, next step after 10 frames
; In:  8(a6) = this
; Out: d0
; Evidence: Player_Nearest; +$2E bit 4 = h-flip
; ---------------------------------------------------------------------------
CapedAcolyte_ActFacePlayer:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	movea.l	d0,a3
	moveq	#$10,d0
	and.b	$2E(a4),d0
	beq.s	loc_0139E8
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	slt.b	d0
	neg.b	d0
	bra.s	loc_0139F4
loc_0139E8:
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	sgt.b	d0
	neg.b	d0
loc_0139F4:
	addq.w	#$4,a7
	bne.s	loc_013A10
	move.l	$8(a3),d0
	cmp.l	$8(a4),d0
	bge.s	loc_013A0A
	ori.b	#$10,$2E(a4)
	bra.s	loc_013A10
loc_013A0A:
	andi.b	#$EF,$2E(a4)
loc_013A10:
	tst.l	$98(a4)
	bne.s	loc_013A24
	move.l	$64(a4),$5C(a4)
	move.w	#$A,$6C(a4)
	bra.s	loc_013A52
loc_013A24:
	addq.w	#$1,$96(a4)
	movea.l	$98(a4),a0
	move.w	$96(a4),d0
	cmp.w	(a0),d0
	blt.s	loc_013A38
	clr.w	$96(a4)
loc_013A38:
	movea.l	$98(a4),a0
	addq.l	#$2,a0
	move.w	$96(a4),d0
	ext.l	d0
	asl.l	#$2,d0
	add.l	a0,d0
	move.l	d0,$5C(a4)
	move.w	#$A,$6C(a4)
loc_013A52:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
