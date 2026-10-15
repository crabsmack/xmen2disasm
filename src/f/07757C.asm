; ---------------------------------------------------------------------------
; CloneA1_LoadResources - add two CloneA1 sprite definitions (jt $3B82 count 1, jt $133E98 count 3), storing their ids in $FFE782/$FFE778
; In:  none
; Out: none
; Evidence: two SprDef_Add calls (jt $4E52)
; ---------------------------------------------------------------------------
CloneA1_LoadResources:
	link.w	a6,#$0
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$3982(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$1A7E(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3662(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$1A88(a5)
	unlk	a6
	rts
