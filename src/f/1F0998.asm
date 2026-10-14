; ---------------------------------------------------------------------------
; sub_1F0998	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F0998:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.w	#$3C,$6A(a4)
	lea.l	$2BCA(a5),a0
	move.l	(a4),d0
	cmp.l	$2(a0),d0
	bne.s	loc_1F09BC
	move.l	a4,-(a7)
	jsr	$4AD2(a5)	; -> sub_1E2CBC
	addq.w	#$4,a7
loc_1F09BC:
	clr.w	$6C(a4)
	lea.l	sub_1F0930(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
