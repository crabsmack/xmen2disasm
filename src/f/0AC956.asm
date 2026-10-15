; ---------------------------------------------------------------------------
; PerimeterDoor_StateWaitBroken - PERIMETERDOOR state: wait until the door has taken more than 10 hits
; In:  8(a6) = this
; Out: d0
; Evidence: -$3C34 > 10 -> PerimeterDoor_StateCrumble; TAS 31697-33050
; Found: link-after-rts
; ---------------------------------------------------------------------------
PerimeterDoor_StateWaitBroken:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#$B,d0
	cmp.w	g_PerimeterDoorHits(a5),d0
	bgt.s	loc_0AC97A
	clr.w	$6C(a4)
	lea.l	PerimeterDoor_StateCrumble(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_0AC97A:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
