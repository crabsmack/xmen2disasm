; ---------------------------------------------------------------------------
; Cerebro_TextOpPrint - text script default op: print the text at the relative offset, then fetch the next op
; In:  a4 = script pointer
; Out: none
; Evidence: default case of Cerebro_RunTextScript: Cerebro_PrintText(ptr + word, op - 7); loc_06569A is the script loop head
; ---------------------------------------------------------------------------
Cerebro_TextOpPrint:
	moveq	#$0,d0
	move.b	d6,d0
	move.w	d0,d5
	subq.w	#$7,d5
	movea.l	a4,a3
	adda.w	(a4)+,a3
	ext.l	d5
	move.l	d5,-(a7)
	move.l	a3,-(a7)
	jsr	Cerebro_PrintText(pc)
	addq.w	#$8,a7
loc_06569A:
	tst.b	(a4)
	bne.w	loc_065596
	move.w	#$FFFF,-$3B02(a5)
	movem.l	-$14(a6),d5-d7/a3-a4
	unlk	a6
	rts
