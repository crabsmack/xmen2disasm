; ---------------------------------------------------------------------------
; BioBalls_AllocBallList - allocate the shared ball list for N balls (filled with -1) and build the 128-entry sine table at $FFE564
; In:  $A(a6) = word ball count
; Out: d0 = list
; Evidence: list kept in $FFE768 and picked up by BioBalls_UpdateBox/SetFormation; Mem_StackAlloc(6N+2), Math_SinDeg
; ---------------------------------------------------------------------------
BioBalls_AllocBallList:
	link.w	a6,#$0
	movem.l	d3/d6-d7/a4,-(a7)
	move.w	$A(a6),d6
	jsr	BioBalls_EmptyStub(pc)
	move.w	d6,d1
	ext.l	d1
	add.l	d1,d1
	move.l	d1,d0
	add.l	d0,d0
	add.l	d0,d1
	move.w	d1,d7
	addq.w	#$2,d7
	pea.l	Str_Empty_11F22A(pc)
	ext.l	d7
	move.l	d7,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_BioBallsList(a5)
	ext.l	d7
	move.l	d7,-(a7)
	pea.l	($FF).w
	move.l	g_BioBallsList(a5),-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	movea.l	g_BioBallsList(a5),a0
	move.w	d6,(a0)
	lea.l	g_BioBallsSine(a5),a4
	clr.w	d7
	lea.l	$14(a7),a7
loc_11F1F6:
	move.w	#$B4,d0
	muls.w	d7,d0
	move.l	#$80,d1
	jsr	$3FA2(a5)	; -> Math_LDivS
	move.l	d0,-(a7)
	jsr	$517A(a5)	; -> Math_SinDeg
	move.l	d0,(a4)
	addq.w	#$4,a7
	move.w	d7,d0
	addq.w	#$1,d7
	addq.w	#$4,a4
	cmpi.w	#$80,d7
	blt.s	loc_11F1F6
	move.l	g_BioBallsList(a5),d0
	movem.l	-$10(a6),d3/d6-d7/a4
	unlk	a6
	rts
