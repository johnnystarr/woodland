#include "woodland.h"

/* local prototypes */
static const char* logo(void);

int main()
{
    printf("%s\nVersion: %s\n", logo(), WOODLAND_VERSION);
    printf("Press [Enter]\n");
    getchar();

	initscr();
	printw("Woodland is a work in progress.\n");
	printw("Feel free to visit https://github.com/johnnystarr/woodland\n\n");
    printw("Hopefully, I can deliver something fun soon!");
	refresh();
	getch();
	endwin();

	return 0;
}

static const char* logo(void) {
    const char* l =
    "                          _ _                 _\n"
    " __      _____   ___   __| | | __ _ _ __   __| |\n"
    " \\ \\ /\\ / / _ \\ / _ \\ / _` | |/ _` | '_ \\ / _` |\n"
    "  \\ V  V / (_) | (_) | (_| | | (_| | | | | (_| |\n"
    "   \\_/\\_/ \\___/ \\___/ \\__,_|_|\\__,_|_| |_|\\__,_|\n";                                                
    return l;
}
