; ---------------------------------------------------------------------------
; ToxicCan_Deactivate - TOXICCAN slot +$46: leave the body hit list, then ACTOR Deactivate
; In:  8(a6) = this
; Out: none
; Evidence: List_Unlink(+$8C, g_HitListPlayerBody); parent +$46
; ---------------------------------------------------------------------------
ToxicCan_Deactivate:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	g_HitListPlayerBody(a5)
	move.l	$8C(a4),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,$8C(a4)
	move.l	a4,-(a7)
	lea.l	$3D5A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$46(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
