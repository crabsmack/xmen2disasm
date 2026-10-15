; ---------------------------------------------------------------------------
; Platform1_Move - move the platform along its floor-segment path: Seg_MoveAlong(this, x speed) once per frame step; at the end of the path (+4 bit $100) save the speed in +$92, stop and pause 10 frames (+$6E) (Platform1 override of slot 18 Move; no velocity/acceleration integration)
; In:  8(a6) = this  $C(a6) = word frame step (1, or 2 when the game runs at half rate)
; Out: none
; Evidence: Seg_MoveAlong marks the chain end in +4 bit $100; method 18 of class descriptor $1072E8 (name string "PLATFORM1", parent SYNCHRONIZEDACTOR)
; ---------------------------------------------------------------------------
Platform1_Move:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	move.w	$E(a6),d7
	movea.l	$8(a6),a4
	tst.w	$16(a4)
	beq.s	loc_106E0A
	bra.s	loc_106DE8
loc_106DD8:
	move.w	$16(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	jsr	$3EBA(a5)	; -> Seg_MoveAlong
	addq.w	#$8,a7
loc_106DE8:
	move.w	d7,d0
	subq.w	#$1,d7
	tst.w	d0
	bne.s	loc_106DD8
	move.w	#$100,d0
	and.w	$4(a4),d0
	beq.s	loc_106E0A
	move.w	$16(a4),$92(a4)
	clr.w	$16(a4)
	move.w	#$A,$6E(a4)
loc_106E0A:
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
