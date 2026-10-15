; ---------------------------------------------------------------------------
; sub_10BB6E	[jt 1361]
; ---------------------------------------------------------------------------
sub_10BB6E:
	link.w	a6,#$FF44
	lea.l	-$BC(a6),a0
	move.l	a0,-$3BC4(a5)
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	pea.l	-$BC(a6)
	jsr	$4DB2(a5)	; -> Mem_Set
	lea.l	-$A8(a6),a0
	move.l	a0,-$3BC8(a5)
	pea.l	($A8).w
	moveq	#$0,d0
	move.l	d0,-(a7)
	pea.l	-$A8(a6)
	jsr	$4DB2(a5)	; -> Mem_Set
	lea.l	$2A7A(a5),a0
	movea.l	-$3BC4(a5),a1
	move.l	$2(a0),(a1)
	jsr	sub_10BB62(pc)
	jsr	sub_10B9D0(pc)
	jsr	sub_10BA6A(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	jsr	sub_10B552(pc)
	jsr	$2E8A(a5)	; -> sub_1190D6
	jsr	$5002(a5)	; -> sub_1FA6FE
	moveq	#$0,d0
	move.l	d0,-(a7)
	jsr	sub_10B552(pc)
	unlk	a6
	rts
