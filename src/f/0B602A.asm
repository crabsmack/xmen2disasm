; ---------------------------------------------------------------------------
; sub_0B602A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0B602A:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1CB2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3C(a5)
	pea.l	-$3B44(a5)
	pea.l	-$3B34(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$1CBA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3C(a5)
	pea.l	-$3B44(a5)
	pea.l	-$3B34(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$1CC2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3C(a5)
	pea.l	-$3B44(a5)
	pea.l	-$3B34(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	unlk	a6
	rts
