; ---------------------------------------------------------------------------
; sub_05ACEC	[jt 401]
; ---------------------------------------------------------------------------
sub_05ACEC:
	link.w	a6,#$0
	jsr	sub_05ABAA(pc)
	jsr	sub_05AB58(pc)
	jsr	sub_05AC24(pc)
	jsr	sub_05AC88(pc)
	jsr	sub_05A8E4(pc)
	jsr	sub_05ACAE(pc)
	jsr	sub_05ACDC(pc)
	moveq	#$25,d0
	move.l	d0,-(a7)
	jsr	$232A(a5)	; -> sub_0C1478
	jsr	$5002(a5)	; -> sub_1FA6FE
	jsr	$2332(a5)	; -> sub_0C14B4
	unlk	a6
	rts
