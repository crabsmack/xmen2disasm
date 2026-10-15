; ---------------------------------------------------------------------------
; BigBio_ClassInit - allocate the 16-orb buffer ($FFE774, 96 bytes) and the spit pool ($FFE770, 128 bytes, count $FFE76E = 0), register g_BigBioSprDef from Art_BigBioSpr and start the BigBio_SpitUpdateAll timer (static, class slot 22, +$5E; does not call the parent)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $123684 (name string "BIGBIO", parent BASICBIOSENTINEL)
; ---------------------------------------------------------------------------
BigBio_ClassInit:
	link.w	a6,#$0
	move.l	a4,-(a7)
	jsr	BigBio_EmptyStub(pc)
	pea.l	Str_Empty_123560(pc)
	moveq	#$60,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_BigBioOrbs(a5)
	pea.l	Str_Empty_12355E(pc)
	pea.l	($80).w
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,g_BigBioSpitPool(a5)
	clr.w	g_BigBioSpitCount(a5)
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
