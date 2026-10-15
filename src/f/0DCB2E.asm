; ---------------------------------------------------------------------------
; Blast_Spawn - create a BLAST from a spawn record
; In:  8(a6) = record {+2 x, +4 y}
; Out: none
; Evidence: Tbl_Blast_vtable +$0E New; jt 1163; callers ControlBox and ControlPanel code; TAS 2782-7178
; Found: jt 1163
; ---------------------------------------------------------------------------
Blast_Spawn:
	link.w	a6,#$0
	movem.l	d6-d7/a3-a4,-(a7)
	movea.l	$8(a6),a4
	move.w	$2(a4),d0
	ext.l	d0
	move.l	d0,d6
	lsl.l	#$8,d6
	move.w	$4(a4),d0
	ext.l	d0
	move.l	d0,d7
	lsl.l	#$8,d7
	move.l	a4,-(a7)
	move.l	d7,-(a7)
	move.l	d6,-(a7)
	lea.l	$24CA(a5),a0
	move.l	$2(a0),-(a7)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$24CA(a5),a0
	movea.l	$2(a0),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	movea.l	d0,a3
	movem.l	-$10(a6),d6-d7/a3-a4
	unlk	a6
	rts
