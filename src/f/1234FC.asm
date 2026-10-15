; ---------------------------------------------------------------------------
; BigBio_ClassInit - BigBio: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; ClassList_InitAll)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $123684 (name string "BIGBIO", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BigBio_ClassInit:
	link.w	a6,#$0
	move.l	a4,-(a7)
	jsr	BigBio_EmptyStub(pc)
	pea.l	Tbl_BigBio2(pc)
	moveq	#$60,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$1A8C(a5)
	pea.l	Tbl_BigBio(pc)
	pea.l	($80).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$1A90(a5)
	clr.w	-$1A92(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3592(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,g_BigBioSprDef(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	d1,-(a7)
	pea.l	BigBio_SpitUpdateAll(pc)
	jsr	$4FD2(a5)	; -> Timer_Create
	move.l	d0,-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	movea.l	-$4(a6),a4
	unlk	a6
	rts
