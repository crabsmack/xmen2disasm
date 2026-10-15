; ---------------------------------------------------------------------------
; sub_0C099C	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0C099C:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	move.l	a4,-(a7)
	jsr	$4EAA(a5)	; -> Player_Nearest
	move.l	d0,$96(a4)
	move.b	$B2(a4),d0
	cmpi.b	#$5,d0
	addq.w	#$4,a7
	bhi.s	loc_0C09D6
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$C09CA(pc,d1.w),d1
	jmp	$C09C8(pc,d1.w)
