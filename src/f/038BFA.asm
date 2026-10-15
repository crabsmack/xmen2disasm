; ---------------------------------------------------------------------------
; sub_038BFA	[jt 257]
; ---------------------------------------------------------------------------
sub_038BFA:
	link.w	a6,#$0
	jsr	sub_0383D4(pc)
	jsr	sub_0383DC(pc)
	jsr	sub_03845C(pc)
	jsr	sub_0387D0(pc)
	jsr	sub_038808(pc)
	jsr	sub_038BAC(pc)
	jsr	sub_038AEE(pc)
	jsr	sub_038AFE(pc)
	jsr	sub_038AA4(pc)
	jsr	sub_038A7E(pc)
	jsr	$5002(a5)	; -> sub_1FA6FE
	move.w	g_VdpReg11(a5),d0
	move.w	d0,($C00004).l
	unlk	a6
	rts
