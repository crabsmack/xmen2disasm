; ---------------------------------------------------------------------------
; sub_082244	[jt 557]
; ---------------------------------------------------------------------------
sub_082244:
	link.w	a6,#$0
	jsr	sub_0821D4(pc)
	jsr	sub_081E02(pc)
	jsr	sub_081EA6(pc)
	jsr	sub_081FFE(pc)
	jsr	sub_081F28(pc)
	jsr	sub_0821E8(pc)
	jsr	$2E8A(a5)	; -> sub_1190D6
	moveq	#$5F,d0
	move.l	d0,-(a7)
	jsr	$232A(a5)	; -> sub_0C1478
	jsr	$5002(a5)	; -> sub_1FA6FE
	jsr	$2332(a5)	; -> sub_0C14B4
	unlk	a6
	rts
