; ---------------------------------------------------------------------------
; sub_005F18	[jt 3]
; ---------------------------------------------------------------------------
sub_005F18:
	link.w	a6,#$0
	move.w	-$1754(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_005F9E
	move.w	-$1844(a5),d0
	ext.l	d0
	move.w	#$C000,d1
	and.w	d0,d1
	moveq	#$0,d0
	move.w	d1,d0
	cmpi.l	#$8000,d0
	bne.s	loc_005F9E
	pea.l	-$165E(a5)
	move.l	-$17C8(a5),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,-$17C8(a5)
	pea.l	-$165A(a5)
	move.l	-$17C4(a5),-(a7)
	jsr	$406A(a5)	; -> List_Unlink
	moveq	#$0,d0
	move.l	d0,-$17C4(a5)
	pea.l	-$1656(a5)
	pea.l	-$1848(a5)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,-$17C8(a5)
	pea.l	-$1652(a5)
	pea.l	-$1848(a5)
	jsr	$4062(a5)	; -> sub_15DF2A
	move.l	d0,-$17C4(a5)
	moveq	#-$4,d0
	and.b	-$181A(a5),d0
	moveq	#$3,d1
	or.b	d0,d1
	move.b	d1,-$181A(a5)
loc_005F9E:
	unlk	a6
	rts
