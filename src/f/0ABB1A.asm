; ---------------------------------------------------------------------------
; sub_0ABB1A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0ABB1A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	$C(a4),-(a7)
	move.l	$8(a4),-(a7)
	jsr	$1B8A(a5)	; -> sub_0AC250
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$52(a0),a1
	jsr	(a1)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
