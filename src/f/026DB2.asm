; ---------------------------------------------------------------------------
; sub_026DB2	[link-after-rts]
; ---------------------------------------------------------------------------
sub_026DB2:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	tst.w	-$3AFA(a5)
	bne.s	loc_026DD6
	movea.l	g_Camera(a5),a0
	move.w	#$64,$40(a0)
	movea.l	g_Camera(a5),a0
	move.w	#$91,$42(a0)
loc_026DD6:
	move.w	$8C(a4),d0
	btst	#$0,d0
	beq.s	loc_026E08
	ori.w	#$1000,$6(a4)
	cmpi.w	#$500,-$3CD0(a5)
	bge.s	loc_026DF4
	addi.w	#$10,-$3CD0(a5)
loc_026DF4:
	move.w	#$1E,$6C(a4)
	lea.l	sub_026E10(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
loc_026E08:
	movea.l	-$4(a6),a4
	unlk	a6
	rts
