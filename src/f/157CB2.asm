; ---------------------------------------------------------------------------
; MagneticGlob_HitCb - ObjList_ForEachAtPoint callback: the bolt hits a body (TakeDamage with the bolt's type and strength)
; In:  8(a6) = target, $C/$10(a6) = words point, $14(a6) = bolt
; Out: d0 = 1 (stop)
; Evidence: target +$26(target, bolt, bolt+$71, bolt+$70, x, y)
; ---------------------------------------------------------------------------
MagneticGlob_HitCb:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a3
	movea.l	$14(a6),a4
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$70(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.b	$71(a4),d0
	ext.w	d0
	ext.l	d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	move.l	a3,-(a7)
	movea.l	(a3),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$1,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
