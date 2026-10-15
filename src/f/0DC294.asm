; ---------------------------------------------------------------------------
; SentinelsD1_InitFlagBits - SentinelsD1: allocate and clear 15 words of switch/door flag bits (-$3BFA)
; In:  none
; Out: none
; Evidence: Mem_StackAlloc($1E); BLAST and CONTROL objects set/clear bits through pointers into it (Blast_SetFlags); TAS 2503-5181
; Found: jt 1144
; ---------------------------------------------------------------------------
SentinelsD1_InitFlagBits:
	link.w	a6,#$0
	movem.l	d7/a4,-(a7)
	pea.l	Str_Empty_0DC2C4(pc)
	moveq	#$1E,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_SentinelsD1Flags(a5)
	movea.l	d0,a4
	moveq	#$F,d7
	addq.w	#$8,a7
loc_0DC2B2:
	clr.w	(a4)
	addq.w	#$2,a4
	subq.l	#$1,d7
	bne.s	loc_0DC2B2
	movem.l	-$8(a6),d7/a4
	unlk	a6
	rts
