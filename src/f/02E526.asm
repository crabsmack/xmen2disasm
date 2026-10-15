; ---------------------------------------------------------------------------
; ExodusBlast_Spawn - create an EXODUSBLAST of kind K at (x, y)
; In:  8(a6) = long x, $C(a6) = long y, $10(a6) = byte kind
; Out: d0 = blast or 0
; Evidence: Tbl_ExodusBlast_vtable +$0E New(0, desc, x, y, 0); +$98 = kind; callers the Exodus_Atk* states
; ---------------------------------------------------------------------------
ExodusBlast_Spawn:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	$C(a6),-(a7)
	move.l	$8(a6),-(a7)
	lea.l	$6EA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	d0,-(a7)
	lea.l	$6EA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a4
	move.l	a4,d0
	beq.s	loc_02E55C
	move.b	$13(a6),$98(a4)
loc_02E55C:
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
