; ---------------------------------------------------------------------------
; sub_0EB6CE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0EB6CE:
	link.w	a6,#$0
	lea.l	$2632(a5),a0
	move.l	$2(a0),-$38A4(a5)
	jsr	$274A(a5)	; -> sub_0E9C04
	moveq	#$4,d0
	move.l	d0,-(a7)
	moveq	#-$10,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$28AA(a5),a0
	move.l	$2(a0),-(a7)
	move.l	$8(a6),-(a7)
	jsr	$3AFA(a5)	; -> sub_13EFA0
	unlk	a6
	rts
