; ---------------------------------------------------------------------------
; Scene_ClearActivateHook - remove the override of the scene loop's object-activation pass
; In:  none
; Out: none
; Evidence: clears long -$38F0(a5); when non-zero sub_1FA124 calls it instead of walking the object list (-$34A6, count -$13F2) calling InWindow (+$3A) / Activate (+$3E)
; ---------------------------------------------------------------------------
Scene_ClearActivateHook:
	link.w	a6,#$0
	moveq	#$0,d0
	move.l	d0,-$38F0(a5)
	unlk	a6
	rts
