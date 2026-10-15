; ---------------------------------------------------------------------------
; CloneA5_SegHook15 - CloneA5 floor-segment hook for type $15: 1 in mode 3 while boss flag -$3B0C bit 7 is set
; In:  8(a6) = word mode
; Out: d0 = 0/1
; Evidence: stored at g_SegTypeHooks+$54(a5) = g_SegTypeHooks[$15] by CloneA5_RunScene; TAS 49340-52155
; Found: link-after-rts
; ---------------------------------------------------------------------------
CloneA5_SegHook15:
	link.w	a6,#$0
	moveq	#$3,d0
	cmp.w	$A(a6),d0
	bne.s	loc_08805E
	move.w	#$80,d0
	and.w	g_SceneVar3B0C(a5),d0
	beq.s	loc_08805E
	moveq	#$1,d0
	bra.s	loc_088060
loc_08805E:
	moveq	#$0,d0
loc_088060:
	unlk	a6
	rts
