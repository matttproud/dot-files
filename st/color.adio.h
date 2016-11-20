/* Suckless ST config.h Fragment
 * Generated with Hodler (http://github.com/matttproud/hodler)
 */
static const char *colorname[] = {
	"#000000",		/* 0: ANSI Color 0 */
	"#d25e5d",		/* 1: ANSI Color 1 */
	"#66a964",		/* 2: ANSI Color 2 */
	"#bbbb00",		/* 3: ANSI Color 3 */
	"#4273e3",		/* 4: ANSI Color 4 */
	"#bb00bb",		/* 5: ANSI Color 5 */
	"#00bbbb",		/* 6: ANSI Color 6 */
	"#bbbbbb",		/* 7: ANSI Color 7 */
	"#555555",		/* 8: ANSI Color 8 */
	"#fc7a80",		/* 9: ANSI Color 9 */
	"#96e294",		/* 10: ANSI Color 10 */
	"#ffff55",		/* 11: ANSI Color 11 */
	"#6396ff",		/* 12: ANSI Color 12 */
	"#ff55ff",		/* 13: ANSI Color 13 */
	"#55ffff",		/* 14: ANSI Color 14 */
	"#ffffff",		/* 15: ANSI Color 15 */
	[255] = 0,
	[256] = "#121212",		/* 256: Background */
	[257] = "#cecece",		/* 257: Foreground */
	[258] = "#1084da",		/* 258: Cursor */
	[259] = "#ffffff",		/* 259: Cursor Text */
	/* No support for text highlight coloring; would be #ffffff. */
	/* No support for highlight coloring; would be #09263e. */
	/* No support for bold coloring; would be #ffffff. */
};

static unsigned int defaultfg  = 257;
static unsigned int defaultbg  = 256;
static unsigned int defaultcs  = 258;
static unsigned int defaultrcs = 259;

/*
 * Color used to display font attributes when fontconfig selected a font which
 * doesn't match the ones requested.
 */
static unsigned int defaultattr = 11;
