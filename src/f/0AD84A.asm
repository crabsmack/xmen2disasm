; ---------------------------------------------------------------------------
; SavageA2_LoadResources - SavageA2: load its resource set into -$1A88
; In:  none
; Out: none
; Evidence: sub_1F62C0(jt[$3E98], 3)
; Found: link-after-rts
; ---------------------------------------------------------------------------
SavageA2_LoadResources:
	link.w	a6,#$0
	moveq	#$3,d0
	move.l	d0,-(a7)
	lea.l	$3662(a5),a0
	move.l	$2(a0),-(a7)
	jsr	$4E52(a5)	; -> SprDef_Add
	move.w	d0,-$1A88(a5)
	unlk	a6
	rts
