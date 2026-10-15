; ---------------------------------------------------------------------------
; sub_0F4CD8	[jt 1317]
; ---------------------------------------------------------------------------
sub_0F4CD8:
	link.w	a6,#$0
	jsr	sub_0F4B2C(pc)
	jsr	sub_0F4C72(pc)
	jsr	sub_0F4542(pc)
	jsr	$5002(a5)	; -> sub_1FA6FE
	bra.s	loc_0F4CF2
loc_0F4CEE:
	jsr	$5112(a5)	; -> VDP_WaitVBlank
loc_0F4CF2:
	tst.b	-$3A02(a5)
	bne.s	loc_0F4CEE
	jsr	$5242(a5)	; -> Snd_StopAll
	unlk	a6
	rts
