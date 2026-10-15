; ---------------------------------------------------------------------------
; ApocBomb_AccelTimer - timer callback: raise the bomb speed by its increase each frame, up to $280
; In:  none
; Out: none
; Evidence: started by ApocBomb_StartAccelTimer
; ---------------------------------------------------------------------------
ApocBomb_AccelTimer:
	link.w	a6,#$0
	cmpi.w	#$280,-$3C70(a5)
	bge.s	loc_04DF8E
	move.w	-$3C72(a5),d0
	add.w	d0,-$3C70(a5)
loc_04DF8E:
	unlk	a6
	rts
