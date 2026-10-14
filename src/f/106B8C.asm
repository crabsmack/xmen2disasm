; ---------------------------------------------------------------------------
; sub_106B8C	[jt 1337]
; ---------------------------------------------------------------------------
sub_106B8C:
	link.w	a6,#$0
	moveq	#-$1,d0
	cmp.w	-$3BD4(a5),d0
	beq.s	loc_106BAE
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$29D2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3BD4(a5)
	addq.w	#$8,a7
loc_106BAE:
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2A1A(a5),a0
	movea.l	$2(a0),a0
	movea.l	$2(a0),a0
	movea.l	$5E(a0),a1
	jsr	(a1)
	jsr	sub_106B60(pc)
	addq.w	#$4,a7
	unlk	a6
	rts
