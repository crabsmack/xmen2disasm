/* Seq_NextWrap - fetch the next word of a -1-terminated sequence; at the end restart at entry 0 and report the wrap */

short Seq_NextWrap(short *seq, short *idx, short *out)
{
	*out = *(seq + *idx);
	if (*out == -1) {
		*idx = 1;
		*out = *seq;
		return 1;
	}
	(*idx)++;
	return 0;
}
