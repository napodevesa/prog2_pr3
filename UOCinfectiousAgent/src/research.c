#include <stdbool.h>
#include <stdio.h>
#include <limits.h>
#include <assert.h>
#include <stdlib.h>
#include "research.h"
#include "infection.h"
#include "country.h"
#include "commons.h"
#include "error.h"


// Creates a research element out of a country and a stats
tError research_init(tResearch* object, tCountry* country) {
     // PR3_EX1     
    tInfectionStats ifs = { 0, 0, 0};

    assert (object != NULL);   

	// Allocate the memory for all the fields. To allocate memory we use the malloc command.
    object->country = (tCountry*)malloc(sizeof(tCountry));

	if (object->country == NULL) {
        // Some of the fields have a NULL value, what means that we found some problem allocating the memory
        return ERR_MEMORY_ERROR;
    }
	
	 // Once the memory is allocated, copy the data.
    country_cpy(object->country, country);  

    ifs.Infectivity = country_totalCases(object->country);
    ifs.Severity = country_totalCriticalCases(object->country);
    ifs.Lethality = country_totalDeaths(object->country);
    
    object->stats = ifs;
    
    return OK; 
}

// Releases data pointed by research element
void research_free(tResearch* object) {
     // PR3_EX1     
	assert (object != NULL);
	  
    if (object->country != NULL) {
       country_free(object->country);
       free(object->country);
       object->country = NULL;
    }
	
   
    
}

// Compare stats of two countries, 1 if s1 wins, -1 if s2 wins, 0 if tie
int research_compare(tInfectionStats s1, tInfectionStats s2) {
    // PR3_EX1
    if (s1.Infectivity == s2.Infectivity) {
        if (s1.Severity == s2.Severity) {
            if (s1.Lethality == s2.Lethality) {
                return 0;
            }
            else if (s1.Lethality > s2.Lethality) {
                return 1;
            }
            else return -1;
        } else if (s1.Severity > s2.Severity) {
            return 1;
        } else return -1;
    } else if (s1.Infectivity > s2.Infectivity) {        
        return 1;
    } else return -1;
}

// Create the research list
void researchList_create(tResearchList* list) {
    // PR3_EX2
    // Check preconditions
    assert(list != NULL);

    // Assign pointers to NULL
    list->first = NULL;
    list->last = NULL;
    list->size = 0;
}

// Insert/adds a new research to the research list

tError researchList_insert(tResearchList* list, tResearch* research, int index) {
    // PR3_EX2

    // Check preconditions
    assert(list != NULL);
    assert(index > 0);
	
    tResearchListNode *tmp;
    tResearchListNode *prev; // Stores the node allocated on index-1
	
	// Out of range
    if (index > list->size+1) 
		return ERR_INVALID_INDEX;
	
	// Create new ResearchListNode
    tmp = (tResearchListNode*) malloc(sizeof(tResearchListNode));
	
    if (tmp == NULL) {
        return ERR_MEMORY_ERROR;
    } else {  
		// Create new research
		tmp->e = (tResearch*) malloc(sizeof(tResearch));
		if (tmp->e  == NULL)
		{
            free(tmp);
			return ERR_MEMORY_ERROR;
		}
		research_init(tmp->e, research->country);      
		
        if (index == 1) {
            // add to first position
            tmp->next = list->first;
            tmp->prev = NULL;

            // Update first position of the list
            if (list->first != NULL) {
                list->first->prev = tmp;
            }
            
            list->first = tmp;            
        } else {
            // Goes in between. Gets current node from position index-1, that will we "prev" from new node
            prev = researchList_get(list, index-1);
            if (prev != NULL) {
                // Fill "prev" and "next" from new node
                tmp->prev = prev;
                tmp->next = prev->next; // Could be null if index==size

                // New node goes in position index
                prev->next = tmp;
                if (tmp->next != NULL)
                    tmp->next->prev = tmp;
            } 
            else {				
				research_free(tmp->e);
				free(tmp->e);
				free(tmp);    
                return ERR_INVALID_INDEX;
                
            }
        }
        
        // Update size of list
        list->size++;
        
        // Update last position
        if (index == list->size) {
            list->last = tmp;
        }
       
        return OK;
    }    
}

// Deletes a research from the research list
tError researchList_delete(tResearchList* list, int index) {
    // PR3_EX2
    
    // Check preconditions
    assert(list != NULL);
    assert(index > 0);

    tResearchListNode *tmp;
    tResearchListNode *prev;

    if (index == 1) {
        // Deletes first position
        tmp = list->first;
        if (tmp == NULL) {
            return ERR_EMPTY_LIST;
        } else {
            // Updates first position
            list->first = tmp->next;
            
            // Updates prev after deleting first position
            if (tmp->next != NULL) {
                tmp->next->prev = NULL;
            }
        }
    } else {
        prev = researchList_get(list, index - 1);
        if (!(prev == NULL)) {
            // standard case, deletes node from between
            tmp = prev->next;
            if (tmp == NULL) {
                return ERR_INVALID_INDEX;
            } else {
                // Updates list after deleting a node
                prev->next = tmp->next;
                if (tmp->next != NULL) {
                    tmp->next->prev = tmp;
                }
            }
        } else {
            return ERR_INVALID_INDEX;
        }
    }
    
    // Update size of list
    list->size--;
    
    // Update last position
    if (list->size > 0) {
        list->last = researchList_get(list, list->size);
    } else {
        list->last = NULL;
    }
    
    // Free memory
	research_free(tmp->e);
	free(tmp->e);
    free(tmp);
    
    return OK;
}

// Gets research from given position, NULL if out of bounds
tResearchListNode* researchList_get(tResearchList* list, int index) {
    // PR3_EX2
    
    // Check preconditions
    assert(list != NULL);
    assert(index > 0);
	
    int i;
    tResearchListNode *prev;

    // Loop until find index position
    i = 1;
    prev = list->first;
    while (i < index && (prev != NULL)) {
        prev = prev->next;
        i++;
    }

    return prev;
}

// Gets true if list is empty
bool researchList_empty(tResearchList* list) {
    // PR3_EX2
    // Check preconditions
    assert(list != NULL);
    if(list->first == NULL){
        return true;
    }
    return false;
}

// Remove all data for a research list
void researchList_free(tResearchList* list) {
    // PR3_EX2
    // Check preconditions
    assert(list != NULL);
   
	
    int i;
    
    // Delete all elements from the list. Start in last position for optimization
    for (i = list->size; i > 0; i--) {
        researchList_delete(list, i);
    }

    list->first = NULL;
	list->last = NULL;
}


// given a list of country' research, returns the position of the country in the list
int researchList_getPosByCountryRecursive(tResearchListNode* first, tCountry *country, int pos) {
    // PR3_EX3

    // Check preconditions
    if (first == NULL) return -1;

    if (country_equal(first->e->country, country)){
        return pos;        
    }

    return researchList_getPosByCountryRecursive(first->next, country, ++pos);

}

// given a list of country' research, returns the position of the country in the list
int researchList_getPosByCountry(tResearchList* list, tCountry *country) {
    // PR3_EX3

    // Check preconditions
    assert(list != NULL);
    
    tResearchListNode *prev = NULL;
    int position;
   
    prev = list->first;
    // check if is an empty list 

    if (researchList_empty(list)) {
        position = -1;
    }
    else{
        // recursive until find country position
        position = researchList_getPosByCountryRecursive(prev,country,1);
    }
    
    return position;
}


// Swap two elements in the list
tError researchList_swap(tResearchList* list, int index_dst, int index_src) {
    // PR3_EX3
  
    assert (list != NULL);
    
    tError err;
    tResearch research_src, research_dst; 
	tResearchListNode * researchNode_src, * researchNode_dst;
		
    // get source node, store its elem  / don't delete (do not modify list len)
	researchNode_src = researchList_get(list, index_src);
	research_init(&research_src,researchNode_src->e->country);
    //e_src = pNode_src->e;    
        
    // get dest node, store / don't delete (do not modify list len)
	researchNode_dst = researchList_get(list, index_dst);
	research_init(&research_dst,researchNode_dst->e->country);
    //e_dst = pNode_dst->e;
    
    // now delete src_node
    err = researchList_delete(list, index_src);
    if (err == OK) {    
         // And put destination elem in source pos

		err = researchList_insert(list, &research_dst, index_src);    
		if (err ==OK) {
			// Now delete dest pos, insert source elem in its pos
			err = researchList_delete(list, index_dst);
			if (err ==OK) {				
				 err = researchList_insert(list, &research_src, index_dst);    
				
			}
		}
    }     
	
	research_free(&research_src);
	research_free(&research_dst);


    return err;
}

// Sorts input list using bubbleSort algorithm
tError researchList_bubbleSort(tResearchList *list) {
    // PR3_EX3
    
    assert (list != NULL);

    int i, j;    
    tError err;    
    tResearchListNode *j_node, *jj_node;

    for(i = 0; i < list->size - 1; i++) {

        for (j = 0; j < list->size - i - 1; j++) {
            
                // Get two nodes to compare
            j_node = researchList_get(list, j + 1);
            jj_node = researchList_get(list, j + 2);
            

            if (research_compare(j_node->e->stats, jj_node->e->stats) == -1) {
                
                err = researchList_swap(list, j + 1, j + 2);
                
                if (err != OK) {
                    return err; // Broken list 
                }                
                
            } 
            
        } 
    } 
    
    return OK;
}


// Helper function, print list contents
void researchList_print(tResearchList list) {    
    tResearchListNode *pLNode;
    
    printf("===== List Contents:\n\n");
    
    for (int i = 0; i < list.size; i++) {
        pLNode = researchList_get(&list, i+1);
        printf("\tElemPos: %d:\tInfectivity: %d;\tSeverity: %d;\tLethality: %d;\tCountry_Name: \"%s\"\n", 
                i+1,
                pLNode->e->stats.Infectivity, 
                pLNode->e->stats.Severity,
                pLNode->e->stats.Lethality,
				pLNode->e->country->name
                );

    }
    
    printf("\n===== End Of List: %d elems\n", list.size);
}
