; ---------------------------------------------------------------------------
; BioSentinel_Init - BioSentinel: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $1235F6 (name string "BIOSENTINEL", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BioSentinel_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3572(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$345A(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$8C(a4)
	moveq	#$0,d0
	move.b	$2(a0),d0
	move.w	d0,$68(a4)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	$4(a3),$12(a4)
	move.w	$2(a3),d0
	move.w	d0,$10(a4)
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$8(a4)
	move.w	$12(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,$C(a4)
	move.w	#$4,$68(a4)
	lea.l	BioSentinel_StateStart(pc),a0
	move.l	a0,$5C(a4)
	lea.l	BioSentinel_StateStart(pc),a0
	move.l	a0,$64(a4)
	lea.l	BioSentinel_StateHurt(pc),a0
	move.l	a0,$60(a4)
	ori.w	#$80,$6(a4)
	lea.l	$358A(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$1,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	move.w	g_Player1+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	lea.l	$10(a7),a7
	bne.s	loc_120AB2
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_120AE8
	ori.b	#$4,$2E(a4)
	bra.s	loc_120AE8
loc_120AB2:
	move.w	g_Player2+$4(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_120ADA
	moveq	#$4,d0
	and.b	g_Player2+$2E(a5),d0
	beq.s	loc_120AE8
	ori.b	#$4,$2E(a4)
	bra.s	loc_120AE8
loc_120ADA:
	moveq	#$4,d0
	and.b	g_Player1+$2E(a5),d0
	beq.s	loc_120AE8
	ori.b	#$4,$2E(a4)
loc_120AE8:
	move.b	$9(a3),$96(a4)
	tst.w	$A(a3)
	beq.s	loc_120AFC
	move.w	$A(a3),$9E(a4)
	bra.s	loc_120B02
loc_120AFC:
	move.w	#$5A,$9E(a4)
loc_120B02:
	tst.w	$C(a3)
	beq.s	loc_120B10
	move.w	$C(a3),$A0(a4)
	bra.s	loc_120B16
loc_120B10:
	move.w	#$2,$A0(a4)
loc_120B16:
	move.w	$E(a3),d0
	beq.s	loc_120B26
	subq.w	#$1,d0
	beq.s	loc_120B2E
	subq.w	#$1,d0
	beq.s	loc_120B36
	bra.s	loc_120B3C
loc_120B26:
	move.w	#$120,$A4(a4)
	bra.s	loc_120B3C
loc_120B2E:
	move.w	#$80,$A4(a4)
	bra.s	loc_120B3C
loc_120B36:
	move.w	#$200,$A4(a4)
loc_120B3C:
	clr.b	$A6(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
