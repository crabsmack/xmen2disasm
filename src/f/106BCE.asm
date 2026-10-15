; ---------------------------------------------------------------------------
; Platform1_LevelStart - Platform1: per-class hook run at level start after the first spawn pass (static, class slot 23, +$62; ClassList_CallSlot62)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 23 of class descriptor $1072E8 (name string "PLATFORM1", parent SYNCHRONIZEDACTOR)
; ---------------------------------------------------------------------------
Platform1_LevelStart:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2A1A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$62(a0),a1
	jsr	(a1)
	clr.w	-$3BD4(a5)
	unlk	a6
	rts
