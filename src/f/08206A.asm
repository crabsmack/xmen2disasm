; ---------------------------------------------------------------------------
; sub_08206A	[jt 554]
; ---------------------------------------------------------------------------
sub_08206A:
	link.w	a6,#$0
	move.l	a4,-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	move.l	d0,-(a7)
	moveq	#$1,d1
	move.l	d1,-(a7)
	pea.l	sub_082038(pc)
	jsr	$4FD2(a5)	; -> sub_1F9C92
	movea.l	d0,a4
	move.w	#$300,-$3AFA(a5)
	move.l	a4,d0
	lea.l	$10(a7),a7
	beq.s	loc_0820A6
	move.l	a4,$10(a4)
	move.l	a4,-(a7)
	jsr	$4FDA(a5)	; -> sub_1F9D04
	move.l	g_Camera(a5),-(a7)
	jsr	sub_081F02(pc)
	addq.w	#$8,a7
loc_0820A6:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
