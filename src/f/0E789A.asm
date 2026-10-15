; ---------------------------------------------------------------------------
; SentinelsA1_LoadResources - SentinelsA1: load four graphics resources (via SprDef_Add) into stage globals
; In:  none
; Out: none
; Evidence: resource thunks $0EC0B0, $0EB012, $0E7CD6, $0E844E -> $FFC62A/$FFC628/$FFC61C/$FFC61E
; ---------------------------------------------------------------------------
SentinelsA1_LoadResources:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-(a7)
	lea.l	$28B2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3BD6(a5)
	moveq	#$1,d0
	move.l	d0,-(a7)
	lea.l	$2822(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3BD8(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$26F2(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3BE4(a5)
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$273A(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3BE2(a5)
	unlk	a6
	rts
