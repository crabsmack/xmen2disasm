; ---------------------------------------------------------------------------
; BubbleManager_Init - vtable +$12 constructor: run the parent's Init, then set up a BUBBLEMANAGER
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the BUBBLEMANAGER descriptor $0AAFA8; TAS frames 29716-31577 (14 frames active); calls parent XNPC slot +$12; state handler(s) put in +$5C: sub_0AB30C
; ---------------------------------------------------------------------------
BubbleManager_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1AE2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.b	$42(a4)
	ori.b	#$4,$2E(a4)
	ori.w	#$408B,$6(a4)
	lea.l	sub_0AB30C(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_0AB30C(pc),a0
	move.l	a0,$64(a4)
	clr.l	$94(a4)
	clr.l	$98(a4)
	move.w	#$B4,$9C(a4)
	move.w	#$2,$9E(a4)
	move.l	a3,d0
	lea.l	$10(a7),a7
	beq.s	loc_0AB1C0
	moveq	#$0,d0
	move.b	-$3B5E(a5),d0
	cmp.w	g_SceneIndex(a5),d0
	bne.s	loc_0AB1B6
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	sub_0AB0E6(pc)
	addq.w	#$8,a7
	bra.s	loc_0AB1C0
loc_0AB1B6:
	move.l	a3,-(a7)
	move.l	a4,-(a7)
	jsr	sub_0AB080(pc)
	addq.w	#$8,a7
loc_0AB1C0:
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
