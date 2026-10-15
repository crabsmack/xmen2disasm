; ---------------------------------------------------------------------------
; Rocket_SetAngleB - rocket set-up wrapper with two extra (unused) words (Rocket_SetAngleOwner)
; In:  8(a6) = rocket  $C(a6) = owner  $12(a6) = word angle  $16/$1A(a6) = words
; Out: none
; Evidence: caller $0B78B8; TAS 212-1089
; ---------------------------------------------------------------------------
Rocket_SetAngleB:
	link.w	a6,#$0
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$16(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	jsr	Rocket_SetAngleOwner(pc)
	unlk	a6
	rts
