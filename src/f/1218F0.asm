; ---------------------------------------------------------------------------
; BigBio_Init - BigBio: constructor: chain to the parent Init, then set this class's fields (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = spawn record or 0
; Out: none
; Evidence: method 3 of class descriptor $123684 (name string "BIGBIO", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BigBio_Init:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$14(a6),a3
	movea.l	$8(a6),a4
	move.l	a3,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$357A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	clr.w	$1E(a4)
	clr.l	$16(a4)
	clr.w	$20(a4)
	move.w	#$32,$68(a4)
	clr.w	$A2(a4)
	lea.l	BigBio_StateStart(pc),a0
	move.l	a0,$5C(a4)
	lea.l	BigBio_StateStart(pc),a0
	move.l	a0,$64(a4)
	ori.w	#$80,$6(a4)
	lea.l	$3582(a5),a0
	move.l	$2(a0),$30(a4)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	tst.w	$6(a3)
	beq.s	loc_121970
	ori.b	#$4,$2E(a4)
	bra.s	loc_121976
loc_121970:
	andi.b	#$FB,$2E(a4)
loc_121976:
	move.w	$2(a3),$B0(a4)
	move.b	#$1,$B6(a4)
	moveq	#$0,d0
	move.l	d0,$AC(a4)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
