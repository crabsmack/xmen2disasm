; ---------------------------------------------------------------------------
; Explosion_HurtActor - explosion hit callback: deal 4 damage (hit type 4) to the actor
; In:  8(a6) = actor  $A/$E(a6) = word x, y
; Out: none
; Evidence: actor vtable +$26 TakeDamage(0, 4, 4, x, y); passed to ObjList_ForEachInBox
; ---------------------------------------------------------------------------
Explosion_HurtActor:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$4,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
