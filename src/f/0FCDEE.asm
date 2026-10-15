; ---------------------------------------------------------------------------
; SiberiaB1_LoadResources - SiberiaB1: load three graphics resources (one is the debris sprite set kept in $FFC6F2)
; In:  none
; Out: none
; Evidence: SprDef_Add with $133E98, $0FBDD2, jt $3BFA
; ---------------------------------------------------------------------------
SiberiaB1_LoadResources:
	link.w	a6,#$0
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3662(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$1A88(a5)
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$2982(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3B0E(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$39FA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$1A74(a5)
	unlk	a6
	rts
