#include <stdio.h>
#include "llist.h"

#define COUNT  sizeof numbers / sizeof (int)
#define COUNT2 sizeof more_numbers / sizeof (int)

int numcmp(void *, void *);
void numprint(void *);

int main()
{
    int numbers[] = {1, 2, 3, 4, 5, 6, 7};
    int more_numbers[] = {8, 9, 10, 11};
    llist *my_list = llist_create(NULL);
    unsigned int i;

    // Print out the empty list
    llist_print(my_list, numprint);

    // Add all of the numbers
    for (i = 0; i < COUNT; i++)
        llist_add_inorder((void *)(numbers + i), my_list, numcmp);

    // Print out list of sorted numbers
    llist_print(my_list, numprint);

    // Remove first five numbers
    for (i = 0; i < COUNT2; i++)
        llist_pop(my_list);

    // Print list again
    llist_print(my_list, numprint);

    // Add numbers to front
    for (i = 0; i < COUNT2; i++)
        llist_push(my_list, &more_numbers[i]);

    // Print list once again
    llist_print(my_list, numprint);

    // Reverse list
    llist_reverse(my_list);

    // Print list once again
    llist_print(my_list, numprint);

    // Rotate list from position 3th
    llist_rotate_from(my_list,3);

    // Print list once again
    llist_print(my_list, numprint);

    // Free the list
    llist_free(my_list);

    return 0;
}

int numcmp(void *a, void *b)
{
    if (*(int *)a < *(int *)b)
        return -1;
    if (*(int *)a > *(int *)b)
        return 1;

    return 0;
}

void numprint(void *num)
{
    int *pnum = (int *)num;
    if (num == NULL)
        return;

    printf("%d", *pnum);
}