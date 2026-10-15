; ---------------------------------------------------------------------------
; Launcher_Init - vtable +$12 constructor: run the parent's Init, then set up a LAUNCHER
; In:  8(a6) = this, $C(a6) = long x, $10(a6) = long y (8 fraction bits), $14(a6) = spawn parameter
; Evidence: slot +$12 of the LAUNCHER descriptor $0BED0C; TAS frames 27946-30538 (21 frames active); calls parent ACTOR slot +$12
; ---------------------------------------------------------------------------
Launcher_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2152(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	ori.w	#$4082,$6(a4)
	move.b	#$1,$70(a4)
	move.w	-$3C2A(a5),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$4E5A(a5)	; -> sub_1F6334
	lea.l	$18(a7),a7
	tst.w	$6(a3)
	beq.s	loc_0BECC2
	move.w	$6(a3),d0
	bra.s	loc_0BECC4
loc_0BECC2:
	moveq	#$78,d0
loc_0BECC4:
	move.b	d0,$8B(a4)
	tst.w	$8(a3)
	beq.s	loc_0BECD4
	move.w	$8(a3),d0
	bra.s	loc_0BECD6
loc_0BECD4:
	moveq	#$5,d0
loc_0BECD6:
	move.b	d0,$8C(a4)
	tst.w	$A(a3)
	beq.s	loc_0BECE6
	move.w	$A(a3),d0
	bra.s	loc_0BECEA
loc_0BECE6:
	move.w	#$800,d0
loc_0BECEA:
	move.w	d0,$8E(a4)
	move.l	a4,-(a7)
	jsr	sub_0BE7E8(pc)
	addq.w	#$4,a7
	lea.l	sub_0BE872(pc),a0
	move.l	a0,$64(a4)
	move.l	a0,$5C(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
