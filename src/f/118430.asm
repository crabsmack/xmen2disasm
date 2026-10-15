; ---------------------------------------------------------------------------
; ICandy_New - ICandy: take a pool slot, construct it (Init) and give it a sprite slot
; In:  8(a6) = unused  $C(a6) = class descriptor  $10/$14(a6) = x, y (16.16)
; Out: d0 = object or 0 when the pool is full
; Evidence: method 1 of ICANDY; ICandy_PoolAlloc, vtable +$E (Init), sub_1F8FA2 result stored at +$3C
; ---------------------------------------------------------------------------
ICandy_New:
	link.w	a6,#$0
	move.l	a4,-(a7)
	jsr	ICandy_PoolAlloc(pc)
	movea.l	d0,a4
	move.l	a4,d0
	beq.s	loc_1184A2
	move.l	$C(a6),(a4)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$E(a0),a1
	jsr	(a1)
	tst.l	$3E(a4)
	lea.l	$C(a7),a7
	beq.s	loc_11846A
	move.l	$3E(a4),-(a7)
	jsr	$4FDA(a5)	; -> Timer_Start
	addq.w	#$4,a7
loc_11846A:
	moveq	#$0,d0
	move.l	d0,-(a7)
	moveq	#$8,d1
	and.w	$6(a4),d1
	moveq	#$0,d2
	move.w	d1,d2
	move.l	d2,-(a7)
	moveq	#$0,d1
	move.b	$30(a4),d1
	move.l	d1,-(a7)
	moveq	#$4,d1
	and.b	$1C(a4),d1
	moveq	#$0,d2
	move.b	d1,d2
	move.l	d2,-(a7)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	move.l	$16(a0),-(a7)
	jsr	$4F6A(a5)	; -> DrawList_Add
	move.w	d0,$3C(a4)
	lea.l	$18(a7),a7
loc_1184A2:
	move.l	a4,d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
