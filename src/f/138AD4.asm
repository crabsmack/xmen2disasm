; ---------------------------------------------------------------------------
; MaintRobotFire_Update - MaintRobotFire: per-frame update: range checks, Move, run the state function at +$5C after the +$6C delay (class slot 17, +$4A)
; In:  8(a6) = this
; Out: none
; Evidence: method 17 of class descriptor $139180 (name string "MAINTROBOTFIRE", parent ACTOR)
; ---------------------------------------------------------------------------
MaintRobotFire_Update:
	link.w	a6,#$0
	movem.l	d5-d7/a4,-(a7)
	movea.l	$8(a6),a4
	tst.b	g_TwoPlayerStep(a5)
	beq.s	loc_138AEA
	moveq	#$2,d7
	bra.s	loc_138AEC
loc_138AEA:
	moveq	#$1,d7
loc_138AEC:
	move.l	$8(a4),d5
	move.l	$C(a4),d6
	move.l	$C(a4),d0
	sub.l	d6,d0
	move.l	d0,-(a7)
	move.l	$8(a4),d0
	sub.l	d5,d0
	move.l	d0,-(a7)
	ext.l	d7
	move.l	d7,-(a7)
	move.l	a4,-(a7)
	jsr	$412A(a5)	; -> Anim_AdvanceByDistance
	tst.b	d0
	lea.l	$10(a7),a7
	beq.s	loc_138B1C
	ori.w	#$8,$4(a4)
loc_138B1C:
	tst.l	$44(a4)
	bne.s	loc_138B30
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
	bra.s	loc_138B38
loc_138B30:
	move.l	a4,-(a7)
	jsr	$4DD2(a5)	; -> Obj_UpdateBoxes
	addq.w	#$4,a7
loc_138B38:
	movem.l	-$10(a6),d5-d7/a4
	unlk	a6
	rts
