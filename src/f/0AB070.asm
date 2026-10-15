; ---------------------------------------------------------------------------
; BubbleManager_ClassInit - per-level class setup that does nothing: only calls BubbleManager_Nop6A (itself an empty static) (BUBBLEMANAGER override of slot +$5E ClassInit)
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Out: none
; Evidence: slot +$5E of the BUBBLEMANAGER descriptor $0AAFA8; TAS frames 29684-32204 (3 frames active)
; ---------------------------------------------------------------------------
BubbleManager_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	BubbleManager_Nop6A(pc)
	unlk	a6
	rts
