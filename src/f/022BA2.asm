; ---------------------------------------------------------------------------
; sub_022BA2	[jt 156]
; ---------------------------------------------------------------------------
sub_022BA2:
	link.w	a6,#$0
	jsr	sub_022B66(pc)
	jsr	sub_022A4E(pc)
	jsr	sub_022AF6(pc)
	jsr	sub_022B7E(pc)
	jsr	sub_022B76(pc)
	jsr	sub_0228CA(pc)
	jsr	sub_022AE2(pc)
	jsr	$5002(a5)	; -> sub_1FA6FE
	unlk	a6
	rts
