; ---------------------------------------------------------------------------
; BioBullet_HitActor - BIOBULLET hit callback: 1 damage with hit type 8, stop the scan
; In:  8(a6) = actor  $A/$E(a6) = word x, y
; Out: d0 = 1
; Evidence: actor vtable +$26; used with ObjList_ForEachInBox by BioBullet_Update
; ---------------------------------------------------------------------------
BioBullet_HitActor:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$12(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	move.w	$E(a6),d0
	ext.l	d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$26(a0),a1
	jsr	(a1)
	moveq	#$1,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
