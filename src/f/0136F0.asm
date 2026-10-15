; ---------------------------------------------------------------------------
; CapedAcolyte_EndHurt - CAPEDACOLYTE slot +$76 (XNPC EndHurt): run the parent's EndHurt, then remember the current position as home
; In:  8(a6) = this
; Out: none
; Evidence: tools/classes.py CAPEDACOLYTE +$76; parent via Tbl_CapedAcolyte_vtable +2; +$9C/+$A0 = x/y
; ---------------------------------------------------------------------------
CapedAcolyte_EndHurt:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$282(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$76(a0),a1
	jsr	(a1)
	move.l	$8(a4),$9C(a4)
	move.l	$C(a4),$A0(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
