; ---------------------------------------------------------------------------
; sub_0BE2CE	[link-after-rts]
; ---------------------------------------------------------------------------
sub_0BE2CE:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	pea.l	($AC).w
	jsr	$5222(a5)	; -> Snd_Stop
	pea.l	($AC).w
	jsr	$521A(a5)	; -> Snd_Play
	addq.b	#$1,$BE(a4)
	move.b	$BE(a4),d0
	cmpi.b	#$4,d0
	addq.w	#$8,a7
	bhi.s	loc_0BE310
	moveq	#$0,d1
	move.b	d0,d1
	add.w	d1,d1
	move.w	$BE306(pc,d1.w),d1
	jmp	$BE304(pc,d1.w)
