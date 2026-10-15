; ---------------------------------------------------------------------------
; HoloBolt_Spawn - create a HOLOBOLT at (x, y) with velocity (vx, vy)
; In:  8(a6) = x  $C(a6) = y (16.16)  $12(a6) = word vx  $16(a6) = word vy
; Out: d0 = bolt or 0
; Evidence: Tbl_HoloBolt_vtable New (+$E), then +$16/+$18; called by Hologram_Fire*_Bolts (two bolts each)
; ---------------------------------------------------------------------------
HoloBolt_Spawn:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$271A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$271A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	beq.s	loc_0E80D4
	move.w	$12(a6),$16(a4)
	move.w	$16(a6),$18(a4)
loc_0E80D4:
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
