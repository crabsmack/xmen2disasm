; ---------------------------------------------------------------------------
; Actor_New - ACTOR slot +$0E: allocate an object of a class, run its Init, and Activate it if inside the activation window
; In:  8(a6) = unused   $C(a6) = class descriptor   $10(a6)/$14(a6) = long: x, y (8 fraction bits)   $18(a6) = spawn parameter
; Out: d0 = object pointer, 0 if allocation failed
; Evidence: object +0 = descriptor; descriptor +$12 Init(obj, x, y, param); vtable +$3A InActivateWindow then +$3E Activate
; ---------------------------------------------------------------------------
Actor_New:
	link.w	a6,#$0
	movem.l	a3-a4,-(a7)
	movea.l	$C(a6),a3
	jsr	$4DCA(a5)	; -> sub_1F4A1A
	movea.l	d0,a4
	move.l	a4,d0
	beq.s	loc_15DA84
	move.l	a3,(a4)
	move.l	$18(a6),-(a7)
	move.l	$14(a6),-(a7)
	move.l	$10(a6),-(a7)
	move.l	a4,-(a7)
	movea.l	a3,a0
	movea.l	$12(a0),a1
	jsr	(a1)
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3A(a0),a1
	jsr	(a1)
	tst.b	d0
	lea.l	$14(a7),a7
	beq.s	loc_15DA84
	move.l	a4,-(a7)
	movea.l	(a4),a0
	movea.l	$3E(a0),a1
	jsr	(a1)
	addq.w	#$4,a7
loc_15DA84:
	move.l	a4,d0
	movem.l	-$8(a6),a3-a4
	unlk	a6
	rts
