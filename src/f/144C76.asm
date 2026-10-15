; ---------------------------------------------------------------------------
; ToxicCan_Activate - TOXICCAN slot +$3E: ACTOR Activate, then join the player-side body hit list
; In:  8(a6) = this
; Out: none
; Evidence: parent +$3E; +$8C = HitList_Add(this, g_HitListPlayerBody) (so enemy attacks can hit it)
; ---------------------------------------------------------------------------
ToxicCan_Activate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	lea.l	$3D5A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	pea.l	g_HitListPlayerBody(a5)
	move.l	a4,-(a7)
	jsr	$4062(a5)	; -> HitList_Add
	move.l	d0,$8C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
