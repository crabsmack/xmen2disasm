; ---------------------------------------------------------------------------
; EvilDrop_Spawn - create an EVILDROP capsule from a 16-byte spawn record
; In:  8(a6) = record {+2 x, +4 y, +6 clone type, ...}
; Out: d0 = object
; Evidence: Tbl_EvilDrop_vtable +$0E New(0, desc, x << 8, y << 8, rec); jt 699; called by the EvilMaker_ActDrop* actions
; Found: jt 699
; ---------------------------------------------------------------------------
EvilDrop_Spawn:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	move.w	$4(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	move.w	$2(a4),d0
	ext.l	d0
	lsl.l	#$8,d0
	move.l	d0,-(a7)
	lea.l	$1632(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1632(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	move.l	a3,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
