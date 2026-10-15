; ---------------------------------------------------------------------------
; ToxicCanDamaged_Init - TOXICCANDAMAGED slot +$12: TOXICCAN Init with only 2 health
; In:  8(a6) = this, $C..$14(a6) = Init args
; Out: none
; Evidence: parent +$12; +$68 = 2
; ---------------------------------------------------------------------------
ToxicCanDamaged_Init:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	$C(a6),-(a7)
	move.l	a4,-(a7)
	lea.l	$3D62(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.w	#$2,$68(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
