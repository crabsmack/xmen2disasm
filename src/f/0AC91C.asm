; ---------------------------------------------------------------------------
; PerimeterDoor_StateStart - PERIMETERDOOR first state: drop its draw-list sprite, wait for the door to break
; In:  8(a6) = this
; Out: d0
; Evidence: sub_1F9122(+$88); next PerimeterDoor_StateWaitBroken
; Found: link-after-rts
; ---------------------------------------------------------------------------
PerimeterDoor_StateStart:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	moveq	#-$1,d0
	cmp.w	$88(a4),d0
	bge.s	loc_0AC93C
	move.w	$88(a4),d0
	ext.l	d0
	move.l	d0,-(a7)
	jsr	$4F72(a5)	; -> DrawList_Remove
	addq.w	#$4,a7
loc_0AC93C:
	clr.w	$6C(a4)
	lea.l	PerimeterDoor_StateWaitBroken(pc),a0
	move.l	a0,$5C(a4)
	moveq	#$8,d0
	and.w	$4(a4),d0
	movea.l	-$4(a6),a4
	unlk	a6
	rts
