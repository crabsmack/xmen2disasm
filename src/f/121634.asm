; ---------------------------------------------------------------------------
; BigBio_SpitFree - BIGBIO: remove a spit projectile (move the last one into its slot)
; In:  8(a6) = record
; Out: none
; Evidence: Mem_Copy 16 bytes
; ---------------------------------------------------------------------------
BigBio_SpitFree:
	link.w	a6,#$0
	tst.w	g_BigBioSpitCount(a5)
	beq.s	loc_12165E
	moveq	#$10,d0
	move.l	d0,-(a7)
	subq.w	#$1,g_BigBioSpitCount(a5)
	move.w	g_BigBioSpitCount(a5),d1
	ext.l	d1
	movea.l	g_BigBioSpitPool(a5),a0
	asl.l	#$4,d1
	pea.l	(a0,d1.l)
	move.l	$8(a6),-(a7)
	jsr	$4DAA(a5)	; -> Mem_Copy
loc_12165E:
	unlk	a6
	rts
