; ---------------------------------------------------------------------------
; SpikeBall_Init - vtable +$12 constructor: run the parent's Init, then set up a SPIKEBALL
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the SPIKEBALL descriptor $0BF820; TAS frames 27963-30467 (44 frames active); calls parent ACTOR slot +$12
; ---------------------------------------------------------------------------
SpikeBall_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$21EA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$4082,$6(a4)
	move.b	#$1,$70(a4)
	move.w	-$3C20(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	lea.l	$18(a7),a7
	tst.w	$6(a3)
	beq.s	loc_0BF7DC
	move.w	$6(a3),d0
	bra.s	loc_0BF7DE
loc_0BF7DC:
	moveq	#$6,d0
loc_0BF7DE:
	moveq	#$1,d1
	lsl.l	d0,d1
	subq.l	#$1,d1
	move.b	d1,$8D(a4)
	tst.w	$8(a3)
	beq.s	loc_0BF7F4
	move.w	$8(a3),d0
	bra.s	loc_0BF800
loc_0BF7F4:
	move.b	$8D(a4),d0
	lsr.b	#$2,d0
	moveq	#$0,d1
	move.b	d0,d1
	move.w	d1,d0
loc_0BF800:
	move.b	d0,$8E(a4)
	move.b	$B(a3),$8C(a4)
	lea.l	sub_0BF606(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
