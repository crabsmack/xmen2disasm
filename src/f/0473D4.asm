; ---------------------------------------------------------------------------
; BaniMazaA2_UpdateDebris - update the four BaniMazaA2 debris groups
; In:  none
; Out: none
; Evidence: BaniMazaA2_UpdateDebrisGroup on each $86-byte group from g_SceneVar3B14; called from BaniMazaA2_FrameHook when the first group's timer is running
; ---------------------------------------------------------------------------
BaniMazaA2_UpdateDebris:
	link.w	a6,#$0
	movem.l	d3/d7/a4,-(a7)
	movea.l	g_SceneVar3B14(a5),a4
	clr.w	d7
loc_0473E2:
	move.l	a4,-(a7)
	lea.l	$86(a4),a4
	jsr	BaniMazaA2_UpdateDebrisGroup(pc)
	addq.w	#$4,a7
	move.w	d7,d0
	addq.w	#$1,d7
	cmpi.w	#$4,d7
	blt.s	loc_0473E2
	movem.l	-$C(a6),d3/d7/a4
	unlk	a6
	rts
