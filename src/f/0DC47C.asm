; ---------------------------------------------------------------------------
; sub_0DC47C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0DC47C:
	link.w	a6,#$0
	lea.l	sub_0DC350(pc),a0
	move.l	a0,-$388E(a5)
	jsr	sub_0DC394(pc)
	jsr	sub_0DC316(pc)
	jsr	sub_0DC294(pc)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	jsr	$8A(a5)	; -> sub_006BD0
	jsr	$2E8A(a5)	; -> sub_1190D6
	unlk	a6
	rts
