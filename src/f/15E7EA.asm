; ---------------------------------------------------------------------------
; Actor_FreeSegCb - Seg_ForEachOfObj callback: free one floor segment owned by an object
; In:  8(a6) = object, $C(a6) = segment
; Out: none
; Evidence: Seg_Free(segment); passed by Actor_Deactivate
; ---------------------------------------------------------------------------
Actor_FreeSegCb:
	link.w	a6,#$0
	move.l	$C(a6),-(a7)
	jsr	$4F22(a5)	; -> Seg_Free
	unlk	a6
	rts
