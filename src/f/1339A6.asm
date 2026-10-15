; ---------------------------------------------------------------------------
; Rocket_SetAngleA - rocket set-up wrapper (Rocket_SetAngleOwner)
; In:  8(a6) = rocket  $C(a6) = owner  $12(a6) = word angle
; Out: none
; Evidence: 4 callers in other modules ($0BAFF4...)
; ---------------------------------------------------------------------------
Rocket_SetAngleA:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.w	$12(a6),d1
	ext.l	d1
	move.l	d1,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	jsr	Rocket_SetAngleOwner(pc)
	unlk	a6
	rts
