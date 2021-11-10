#include <stdio.h>
#include <stdlib.h>
#include "character.h"

int main()
{	
    Character *ch = malloc(sizeof(Character));
    ch->age = 34;
    ch->level = 100;
    ch->name = "Johnny";

    printf("The character's name is %s\n", ch->name);
    printf("The character's age is %d\n", ch->age);
    printf("The character's level is %d\n", ch->level);

    free(ch);
    return 0;
}
