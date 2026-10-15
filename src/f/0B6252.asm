; ---------------------------------------------------------------------------
; SavageA4_LoadResources - SavageA4: load its resource set into -$3C2E
; In:  none
; Out: none
; Evidence: SprDef_Add(jt[$2AE8], 3)
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA4_LoadResources:
	link.w	a6,#$0
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$35AA(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$3C2E(a5)
	unlk	a6
	rts
