; ---------------------------------------------------------------------------
; MysteryPowerUp_Init - POWERUP Init, then animation +$44 = jt $2EAA (mystery animation) and its first frame (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry or 0
; Out: none
; Evidence: method 3 of class descriptor $117FC0 (name string "MYSTERYPOWERUP", parent POWERUP)
; ---------------------------------------------------------------------------
MysteryPowerUp_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2DBA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	lea.l	$2CAA(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$44(a4)
	move.b	$7(a0),$2F(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
