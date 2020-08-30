//
//  main.c
//  OpenMP Test
//
//  Created by Daniel Carns on 8/28/20.
//  Copyright © 2020 Daniel Carns. All rights reserved.
//

#include <stdio.h>
#ifdef _OPENMP
#   include <omp.h>
#endif

void ompTest(int rank, int numThreads);

int main(int argv, char **argc) {

#   pragma omp parallel num_threads(4)
    {
#   ifdef _OPENMP
        int myRank = omp_get_thread_num();
        int threadCount = omp_get_num_threads();
#   else
        int myRank = 0;
        int threadCount = 0;
#   endif
        ompTest(myRank, threadCount);
    }
    
    return 0;

}

void ompTest(int rank, int numThreads) {
    printf("%s %d %s %d\n", "Rank: ", rank, " of ", numThreads);
}
