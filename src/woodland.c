#include "woodland.h"

int main()
{
    printf("Woodland v%s\n", WOODLAND_VERSION);
    printf("Press [Enter]\n");
    getchar();

	initscr();			/* Start curses mode 		  */
	printw("Woodland!");	/* Print Hello World		  */
	refresh();			/* Print it on to the real screen */
	getch();			/* Wait for user input */
	endwin();			/* End curses mode		  */

	return 0;
}
