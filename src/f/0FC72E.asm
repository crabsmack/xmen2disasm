; ---------------------------------------------------------------------------
; sub_0FC72E	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0FC72E:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$299A(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3C(a5)
	pea.l	-$3B44(a5)
	pea.l	-$3B34(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$29A2(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3C(a5)
	pea.l	-$3B44(a5)
	pea.l	-$3B34(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$29AA(a5),a0
	move.l	$2(a0),-(a7)
	pea.l	-$3B3C(a5)
	pea.l	-$3B44(a5)
	pea.l	-$3B34(a5)
	jsr	$3EB2(a5)	; -> sub_159FD6
	unlk	a6
	rts
