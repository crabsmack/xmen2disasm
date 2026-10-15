; ---------------------------------------------------------------------------
; Deathbird_ClassInit - Deathbird: per-class hook run at level start before the spawn pass (static, class slot 22, +$5E; sub_1FA7E8)
; In:  8(a6) = 0  $C(a6) = class index in the level class list
; Out: none
; Evidence: method 22 of class descriptor $111162 (name string "DEATHBIRD", parent ACTOR)
; ---------------------------------------------------------------------------
Deathbird_ClassInit:
	link.w	a6,#$0
	pea.l	$111E42(pc)
	moveq	#$14,d0
	move.l	d0,-(a7)
	jsr	$5032(a5)	; -> Mem_StackAlloc
	move.l	d0,-$3B18(a5)
	addq.w	#$8,a7
	beq.s	loc_111E16
	moveq	#$14,d0
	move.l	d0,-(a7)
	moveq	#$0,d1
	move.l	d1,-(a7)
	move.l	-$3B18(a5),-(a7)
	jsr	$4DB2(a5)	; -> Mem_Set
	lea.l	$C(a7),a7
loc_111E16:
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2AB2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3BC0(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2AC2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> sub_1F62C0
	move.w	d0,-$3B04(a5)
	unlk	a6
	rts
