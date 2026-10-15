; ---------------------------------------------------------------------------
; BrainChild_Init - vtable +$12 constructor: run the parent's Init, then set up a BRAINCHILD
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the BRAINCHILD descriptor $0B7BAC; TAS frames 33489-33489 (1 frames active); calls parent BIONPC slot +$12
; ---------------------------------------------------------------------------
BrainChild_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$1D82(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$1EA2(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	#$60,$96(a4)
	move.w	#$220,$98(a4)
	move.w	#$60,$9C(a4)
	move.w	#$140,$9A(a4)
	movea.l	-$3B14(a5),a0
	move.b	#$4,$2(a0)
	movea.l	-$3B14(a5),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	lea.l	$1DB2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	$9E(a4)
	jsr	$3ED2(a5)	; -> AiScript_Set
	lea.l	sub_0B6BB2(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	ori.w	#$80,$6(a4)
	ori.w	#$1000,$6(a4)
	ori.w	#$2,$6(a4)
	ori.w	#$1,$6(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	clr.w	$A4(a4)
	lea.l	$1D92(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> Obj_SetAnim
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	moveq	#$45,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> Snd_Stop
	moveq	#$45,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> Snd_Play
	move.l	a4,-$3B20(a5)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
