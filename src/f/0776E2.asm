; ---------------------------------------------------------------------------
; sub_0776E2	[jt 533]
; ---------------------------------------------------------------------------
sub_0776E2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	jsr	sub_0776DA(pc)
	jsr	sub_0775AC(pc)
	jsr	sub_077624(pc)
	lea.l	$10B2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$5102(a5)	; -> Scroll_SetParallax
	jsr	$2E8A(a5)	; -> sub_1190D6
	move.w	#$A,-$BD8(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	pea.l	$10AA(a5)
	moveq	#$3C,d1
	move.l	d1,-(a7)
	pea.l	$3F32(a5)
	jsr	$4FD2(a5)	; -> sub_1F9C92
	move.l	d0,-(a7)
	jsr	$4FDA(a5)	; -> sub_1F9D04
	moveq	#$5E,d0
	move.l	d0,-(a7)
	jsr	$232A(a5)	; -> sub_0C1478
	jsr	$5002(a5)	; -> sub_1FA6FE
	jsr	$2332(a5)	; -> sub_0C14B4
	movea.l	-$4(a6),a4
	unlk	a6
	rts
