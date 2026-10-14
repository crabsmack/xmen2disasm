; ---------------------------------------------------------------------------
; sub_0FD50A	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0FD50A:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$3AF8(a5)
	move.l	d0,-$3AF4(a5)
	lea.l	sub_0FD24C(pc),a0
	move.l	a0,-$3AF0(a5)
	move.l	d0,-$3AEC(a5)
	move.l	d0,-$3AE8(a5)
	move.l	d0,-$3AE4(a5)
	move.l	d0,-$3AE0(a5)
	move.l	d0,-$3ADC(a5)
	move.b	#$1,-$35C8(a5)
	move.b	#$1,-$35CA(a5)
	pea.l	$FD574(pc)
	pea.l	($3C0).w
	jsr	$5032(a5)	; -> sub_1FA8DC
	addq.l	#$8,a7
	move.l	d0,-(a7)
	jsr	sub_0FCE32(pc)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	pea.l	sub_0FCEDE(pc)
	jsr	$4FD2(a5)	; -> sub_1F9C92
	move.l	d0,-$3B28(a5)
	move.l	d0,-(a7)
	jsr	$4FDA(a5)	; -> sub_1F9D04
	unlk	a6
	rts
