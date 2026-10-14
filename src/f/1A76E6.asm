; ---------------------------------------------------------------------------
; sub_1A76E6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1A76E6:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	-$35B6(a5),-(a7)
	jsr	$3EA2(a5)	; -> sub_159ECC
	move.w	#$3C,$6A(a4)
	pea.l	($FF).w
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$56(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	jsr	sub_1A74A2(pc)
	lea.l	$10(a7),a7
	clr.w	$6C(a4)
	lea.l	sub_1A775E(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
