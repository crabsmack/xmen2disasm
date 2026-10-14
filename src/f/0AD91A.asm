; ---------------------------------------------------------------------------
; sub_0AD91A	[jt 896]
; ---------------------------------------------------------------------------
sub_0AD91A:
	link.w	a6,#$0
	jsr	sub_0AD902(pc)
	jsr	sub_0AD866(pc)
	jsr	sub_0AD8EC(pc)
	jsr	sub_0AD84A(pc)
	jsr	sub_0AD3E8(pc)
	jsr	sub_0AD420(pc)
	jsr	sub_0AD16E(pc)
	jsr	sub_0AD7BE(pc)
	jsr	sub_0AD7E4(pc)
	jsr	sub_0AD90A(pc)
	jsr	$2E8A(a5)	; -> sub_1190D6
	jsr	$5002(a5)	; -> sub_1FA6FE
	jsr	$5242(a5)	; -> sub_1FE5F2
	unlk	a6
	rts
