; ---------------------------------------------------------------------------
; Mine_ClassInit - Mine: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; sub_1FA7E8)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $13AF1A (name string "MINE", parent ACTOR)
; ---------------------------------------------------------------------------
Mine_ClassInit:
	link.w	a6,#$0
	jsr	sub_13A7EA(pc)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3992(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$1A76(a5)
	addq.w	#$8,a7
	unlk	a6
	rts
