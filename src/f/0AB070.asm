; ---------------------------------------------------------------------------
; BubbleManager_ClassInit - vtable +$5E: per-level class setup for BUBBLEMANAGER
; In:  8(a6) = 0, $C(a6) = long class index in the level class list
; Evidence: slot +$5E of the BUBBLEMANAGER descriptor $0AAFA8; TAS frames 29684-32204 (3 frames active)
; ---------------------------------------------------------------------------
BubbleManager_ClassInit:
	link.w	a6,#$0
	move.l	$8(a6),-(a7)
	jsr	BubbleManager_Nop6A(pc)
	unlk	a6
	rts
