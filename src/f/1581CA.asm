; ---------------------------------------------------------------------------
; MagneticGlob_Init - MAGNETICGLOB slot +$12: RTHETAOBJECT Init, sprite, palette and speed (player bolts faster and on the player side)
; In:  8(a6) = bolt, $C/$10(a6) = x/y, $14(a6) = placement {+6 by player, +$A VRAM base}
; Out: none
; Evidence: +6 |= $8B; sprite def $14DB16; player -> +6 |= $10, max speed $2000 else $800; +$A4 = VRAM base; SetFrame($FF)
; ---------------------------------------------------------------------------
MagneticGlob_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3E6A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$8B,$6(a4)
	lea.l	$3D92(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	tst.w	$6(a3)
	beq.s	loc_158230
	ori.w	#$10,$6(a4)
	move.w	#$2000,$22(a4)
	move.w	#$2000,$24(a4)
	bra.s	loc_15823C
loc_158230:
	move.w	#$800,$22(a4)
	move.w	#$800,$24(a4)
loc_15823C:
	tst.w	$A(a3)
	beq.s	loc_158248
	move.w	$A(a3),$A4(a4)
loc_158248:
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
