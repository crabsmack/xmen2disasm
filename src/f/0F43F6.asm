; ---------------------------------------------------------------------------
; sub_0F43F6	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0F43F6:
	link.w	a6,#$0
	lea.l	sub_0F4314(pc),a0
	move.l	a0,-$388E(a5)
	jsr	sub_0F4350(pc)
	jsr	$240A(a5)	; -> sub_0DC394
	jsr	$23FA(a5)	; -> sub_0DC316
	jsr	$23E2(a5)	; -> sub_0DC294
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> Players_PlaceAtStart
	jsr	$2E8A(a5)	; -> sub_1190D6
	unlk	a6
	rts
