; ---------------------------------------------------------------------------
; Spr_InvalidateFrame - force a sprite instance to re-upload its frame graphics on the next draw
; In:  8(a6) = sprite instance (object+$2E)
; Out: none
; Evidence: clears flag bit 5 and sets the uploaded-frame byte +$A to $FF; Spr_Draw uploads (Spr_UploadFrame) when bit 5 is clear
; ---------------------------------------------------------------------------
Spr_InvalidateFrame:
	link.w	a6,#$0
	move.l	a4,-(a7)
	movea.l	$8(a6),a4
	andi.b	#$DF,(a4)
	move.b	#$FF,$A(a4)
	movea.l	-$4(a6),a4
	unlk	a6
	rts
