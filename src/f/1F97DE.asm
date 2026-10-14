; ---------------------------------------------------------------------------
; sub_1F97DE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_1F97DE:
	link.w	a6,#$0
	move.l	d7,-(a7)
	jsr	$51F2(a5)	; -> sub_1FE3D8
	jsr	$51A2(a5)	; -> sub_1FE018
	ext.l	d0
	move.l	d0,d7
	jsr	$51FA(a5)	; -> sub_1FE3EC
	move.l	#$80,d0
	and.l	d7,d0
	move.l	-$4(a6),d7
	unlk	a6
	rts
