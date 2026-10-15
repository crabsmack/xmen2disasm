; ---------------------------------------------------------------------------
; SpaceB1_LoadResources - SpaceB1: register a sprite-definition resource
; In:  none
; Out: none
; Evidence: SprDef_Add(thunk $13F946, 3) -> $FFE78E; $FFE782 = -1
; ---------------------------------------------------------------------------
SpaceB1_LoadResources:
	link.w	a6,#$0
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3B72(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$1A72(a5)
	move.w	#$FFFF,-$1A7E(a5)
	unlk	a6
	rts
