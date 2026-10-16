; ---------------------------------------------------------------------------
; SegmentMinusPowerUp_Init - POWERUP Init, then palette 3, animation +$44 = Tbl_SegmentPowerUpAnim (jt $2C92) (segment animation) and its first frame (class slot 3, +$12)
; In:  8(a6) = this  $C/$10(a6) = x, y (16.16)  $14(a6) = placement entry or 0
; Out: none
; Evidence: method 3 of class descriptor $117D28 (name string "SEGMENTMINUSPOWERUP", parent POWERUP)
; ---------------------------------------------------------------------------
SegmentMinusPowerUp_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$2D92(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	moveq	#-$4,d0
	and.b	$2E(a4),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,$2E(a4)
	lea.l	$2C92(a5),a0
	movea.l	$2(a0),a0
	move.l	a0,$44(a4)
	move.b	$7(a0),$2F(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
