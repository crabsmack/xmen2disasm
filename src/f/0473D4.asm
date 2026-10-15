; ---------------------------------------------------------------------------
; BaniMazaA2_UpdateParts - update the four $86-byte BaniMazaA2 records at -$3B14 with sub_0472E0
; In:  none
; Out: none
; Evidence: called from BaniMazaA2_FrameHook when record +$84 is set; records on BaniMazaA2_RunScene's stack (sub_0472CC)
; ---------------------------------------------------------------------------
BaniMazaA2_UpdateParts:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	-$3B14(a5),a4
	clr.w	d7
loc_0473E2:
	move.l	a4,-(a7)
	lea.l	$86(a4),a4
	jsr	sub_0472E0(pc)
	addq.w	#$4,a7
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$4,d7
	blt.s	loc_0473E2
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
