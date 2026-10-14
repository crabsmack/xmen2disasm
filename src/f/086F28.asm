; ---------------------------------------------------------------------------
; sub_086F28	[jt 635]
; ---------------------------------------------------------------------------
sub_086F28:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	lea.l	$1492(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	pea.l	($91).w
	jsr	$5222(a5)	; -> sub_1FE5A2
	pea.l	($91).w
	jsr	$521A(a5)	; -> sub_1FE584
	lea.l	$10(a7),a7
	move.w	#$FF,$6C(a4)
	lea.l	sub_086F70(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
