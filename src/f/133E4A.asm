; ---------------------------------------------------------------------------
; BigAcBullet_Attack - hit the target with its TakeDamage as hit type 8 (whatever type was passed), then Kill the bullet (BIGACBULLET override of slot 7, +$22; no hit cooldown)
; In:  8(a6) = this  $C(a6) = target actor  $13(a6) = byte hit type (ignored)  $17(a6) = byte damage  $1A/$1E(a6) = words passed on
; Out: none
; Evidence: method 7 of class descriptor $0118BE (name string "BIGACBULLET", parent ACTOR)
; ---------------------------------------------------------------------------
BigAcBullet_Attack:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	movea.l	$8(a6),a4
	move.w	$1E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$1A(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$17(a6),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$8,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
