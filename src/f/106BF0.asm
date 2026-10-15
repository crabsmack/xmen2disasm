; ---------------------------------------------------------------------------
; Platform1_Init - Platform1: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $1072E8 (name string "PLATFORM1", parent SYNCHRONIZEDACTOR)
; ---------------------------------------------------------------------------
Platform1_Init:
	link.w	a6,#$0
	movem.l	d3/a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2A1A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	lea.l	sub_107254(pc),a0
	move.l	a0,$5C(a4)
	lea.l	sub_107254(pc),a0
	move.l	a0,$64(a4)
	moveq	#-$1,d0
	cmp.w	-$3BD4(a5),d0
	lea.l	$10(a7),a7
	beq.s	loc_106C58
	move.w	-$3BD4(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> Obj_SetSpriteDef
	addq.w	#$8,a7
	bra.s	loc_106C70
loc_106C58:
	lea.l	$29D2(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$0,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
loc_106C70:
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	seq.b	d3
	neg.b	d3
	beq.s	loc_106C94
	lea.l	g_Player1(a5),a0
	move.l	a0,d0
	bra.s	loc_106C9A
loc_106C94:
	lea.l	g_Player2(a5),a0
	move.l	a0,d0
loc_106C9A:
	movea.l	d0,a0
	moveq	#$4,d0
	and.b	$2E(a0),d0
	beq.s	loc_106CAA
	ori.b	#$4,$2E(a4)
loc_106CAA:
	move.w	$8(a3),d0
	bmi.s	loc_106CFE
	cmpi.w	#$3,d0
	bgt.s	loc_106CFE
	add.w	d0,d0
	move.w	Sw_106BF0(pc,d0.w),d0
	jmp	Sw_106BF0-2(pc,d0.w)
