; ---------------------------------------------------------------------------
; DropBomb_Spawn - spawn a DROPBOMB at (x, y) with spawn parameter p
; In:  8(a6) = long x, $C(a6) = long y, $10(a6) = spawn parameter
; Out: d0 = new object
; Evidence: calls Tbl_DropBomb_vtable slot +$0E New(0, Tbl_DropBomb_vtable, x, y, p); jt 566; callers BroodBoss_StateDropBomb/BroodBoss_StateDropBomb2 (BROODBOSS code)
; Found: jt 566
; ---------------------------------------------------------------------------
DropBomb_Spawn:
	link.w	a6,#$0
	move.l	a4,-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$11A2(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$11A2(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
