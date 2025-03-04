# main.py - Run all algorithms

from Q1 import minimax_search
from Q2 import alpha_beta_pruning
from Q3 import expectimax_uniform, expectimax_non_uniform

if __name__ == "__main__":
    print("\n==========================================")
    print("COMP6600 HW2 - GAME TREE ALGORITHMS")
    print("==========================================")
    
    print("\n--- QUESTION 1: MINIMAX SEARCH ---")
    minimax_search()
    
    print("\n--- QUESTION 2: ALPHA-BETA PRUNING ---")
    alpha_beta_pruning()
    
    print("\n--- QUESTION 3: EXPECTIMAX ---")
    print("Part A: Uniform probability distribution")
    expectimax_uniform()
    
    print("Part B: Non-uniform probability distribution")
    expectimax_non_uniform()
    
    print("\nAll algorithms completed successfully!")