; ---------------------------------------------------------------------------
; CoreShields_Update - CoreShields: per-frame update: range checks, Move, run the state function at +$5C after the +$6C delay (class slot 17, +$4A)
; In:  8(a6) = this
; Out: none
; Evidence: method 17 of class descriptor $0EBE7E (name string "CORESHIELDS", parent ACTOR)
; ---------------------------------------------------------------------------
CoreShields_Update:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$288A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$4A(a0),a1
	jsr	(a1)
	tst.w	$9A(a4)
	addq.w	#$4,a7
	ble.s	loc_0EB810
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_0EB808
	moveq	#$2,d0
	bra.s	loc_0EB80A
loc_0EB808:
	moveq	#$1,d0
loc_0EB80A:
	ext.w	d0
	sub.w	d0,$9A(a4)
loc_0EB810:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
