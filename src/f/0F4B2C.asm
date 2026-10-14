; ---------------------------------------------------------------------------
; sub_0F4B2C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0F4B2C:
	link.w	a6,#$0
	lea.l	$23CA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	moveq	#-$1,d0
	move.l	d0,-(a7)
	moveq	#$10,d0
	move.l	d0,-(a7)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	lea.l	$23BA(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23C2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$23C2(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2922(a5),a0
	move.l	$2(a0),-(a7)
	lea.l	$2922(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4FCA(a5)	; -> sub_1F98A8
	jsr	sub_0F4CBC(pc)
	move.w	-$3C5E(a5),d0
	ext.l	d0
	move.w	#$8000,d1
	and.w	d0,d1
	lea.l	$40(a7),a7
	beq.s	loc_0F4BB0
	jsr	$5242(a5)	; -> sub_1FE5F2
	moveq	#$60,d0
	move.l	d0,-(a7)
	jsr	$5222(a5)	; -> sub_1FE5A2
	moveq	#$60,d0
	move.l	d0,-(a7)
	jsr	$521A(a5)	; -> sub_1FE584
	addq.w	#$8,a7
loc_0F4BB0:
	ori.w	#$8000,-$3C5E(a5)
	clr.l	-$3980(a5)
	move.w	#$2,-$397C(a5)
	move.w	#$4,-$397A(a5)
	move.w	#$6,-$3978(a5)
	move.w	#$8,-$3976(a5)
	move.w	#$A,-$3974(a5)
	clr.w	-$3972(a5)
	move.w	#$2,-$3970(a5)
	move.w	#$4,-$396E(a5)
	move.w	#$6,-$396C(a5)
	move.w	#$8E,-$3968(a5)
	move.w	#$4A,-$3966(a5)
	move.w	#$6E,-$3964(a5)
	move.w	#$2E,-$3962(a5)
	clr.w	-$393E(a5)
	move.w	#$2,-$393C(a5)
	move.w	#$4,-$393A(a5)
	move.w	#$6,-$3938(a5)
	move.w	#$8,-$3936(a5)
	move.w	#$A,-$3934(a5)
	move.w	#$A,-$3932(a5)
	move.w	#$C,-$3930(a5)
	move.w	#$E,-$392E(a5)
	move.w	#$6,-$392C(a5)
	move.w	#$8,-$392A(a5)
	move.w	#$A,-$3928(a5)
	move.w	#$C,-$3926(a5)
	move.w	#$4,-$3924(a5)
	move.w	#$E,-$3922(a5)
	move.w	#$C0,-$3498(a5)
	move.w	#$80,-$3496(a5)
	clr.b	-$38DE(a5)
	unlk	a6
	rts
