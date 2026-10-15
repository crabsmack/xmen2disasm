; ---------------------------------------------------------------------------
; sub_1835C2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1835C2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	cmpi.w	#$701,$68(a4)
	blt.s	loc_1835E4
	ori.l	#$80000,$90(a4)
	ori.l	#$100000,$90(a4)
loc_1835E4:
	tst.b	$9D(a4)
	bne.s	loc_1835FA
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	g_Pad1Latch(a5),d0
	move.w	d0,g_Pad1Latch(a5)
	bra.s	loc_183608
loc_1835FA:
	move.w	-$3BA8(a5),d0
	not.w	d0
	and.w	g_Pad2Latch(a5),d0
	move.w	d0,g_Pad2Latch(a5)
loc_183608:
	lea.l	$428A(a5),a0
	move.l	$2(a0),-(a7)
	move.l	a4,-(a7)
	jsr	$4E42(a5)	; -> sub_1F626A
	clr.w	$6A(a4)
	lea.l	$4CCA(a5),a0
	move.l	a0,$5C(a4)
	move.w	#$FF,$6C(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
