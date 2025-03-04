# Q3.py - Expectimax for Game Tree with Chance Nodes

def expectimax_uniform():
    """Expectimax search with uniform probabilities at chance nodes"""
    # Define leaf node values from the image
    leaf_pairs = [
        [-3, -6],    # Max node 1
        [10, -8],    # Max node 2
        [-3, 2],     # Max node 3
        [9, -5],     # Max node 4
        [-2, -9],    # Max node 5
        [-4, -8],    # Max node 6
        [1, -2],     # Max node 7
        [-7, -2],     # Max node 8
        [4, -1]     # Max node 9
    ]
    
    # Group max nodes by parent chance node
    max_nodes_by_chance = [
        [0, 1, 2],   # Chance node 1 has max nodes 1, 2, 3
        [3, 4, 5],   # Chance node 2 has max nodes 4, 5, 6
        [6, 7, 8]    # Chance node 3 has max nodes 7, 8, 9
    ]
    
    print("\n======= Q3a: EXPECTIMAX (UNIFORM PROBABILITIES) =======\n")
    
    # Compute max node values
    max_node_values = []
    for pair in leaf_pairs:
        max_value = max(pair)
        max_node_values.append(max_value)
    
    print("MAX NODE VALUES (TRAPEZOIDS):")
    for i, value in enumerate(max_node_values):
        print(f"  Max Node {i+1}: max{leaf_pairs[i]} = {value}")
    
    # Compute chance node values with uniform probability (1/3 for each child)
    chance_node_values = []
    for chance_children in max_nodes_by_chance:
        child_values = [max_node_values[i] for i in chance_children]
        expected_value = sum(child_values) / len(child_values)
        chance_node_values.append(expected_value)
    
    print("\nCHANCE NODE VALUES (CIRCLES):")
    for i, value in enumerate(chance_node_values):
        child_indices = max_nodes_by_chance[i]
        child_values = [max_node_values[j] for j in child_indices]
        print(f"  Chance Node {i+1}: average{child_values} = {value:.2f}")
    
    # Compute root value (max)
    root_value = max(chance_node_values)
    best_chance_index = chance_node_values.index(root_value)
    
    print(f"\nROOT VALUE (MAX): max{[f'{v:.2f}' for v in chance_node_values]} = {root_value:.2f}")
    print(f"Optimal move: Choose Chance Node {best_chance_index + 1}")
    
    # Print the expectimax tree
    print("\nEXPECTIMAX TREE (UNIFORM PROBABILITIES):\n")
    print(f"                         Root (MAX): {root_value:.2f}")
    print(f"                      /      |      \\")
    print(f"                     /       |       \\")
    print(f"        Chance:  {chance_node_values[0]:.2f}     {chance_node_values[1]:.2f}     {chance_node_values[2]:.2f}")
    print(f"                / | \\    / | \\    / | \\")
    
    # Print max nodes in groups of 3
    max_str = "  Max:    "
    for i in range(9):
        max_str += f"{max_node_values[i]}   "
        if i % 3 == 2 and i < 8:
            max_str += "  "
    print(max_str)
    
    # Print leaf values
    leaf_str = "  Leaves: "
    for i, pair in enumerate(leaf_pairs):
        leaf_str += f"{pair}  "
        if i % 3 == 2 and i < 8:
            leaf_str += " "
    print(leaf_str)
    
    print("\n==================================================\n")
    
    return {
        "max_node_values": max_node_values,
        "chance_node_values": chance_node_values,
        "root_value": root_value
    }

def expectimax_non_uniform():
    """Expectimax search with non-uniform probabilities at chance nodes"""
    # Define leaf node values from the image
    leaf_pairs = [
        [-3, -6],    # Max node 1
        [10, -8],    # Max node 2
        [-3, 2],     # Max node 3
        [9, -5],     # Max node 4
        [-2, -9],    # Max node 5
        [-4, -8],    # Max node 6
        [1, -2],     # Max node 7
        [-7, -2],     # Max node 8
        [4, -1]     # Max node 9
    ]
    
    # Group max nodes by parent chance node
    max_nodes_by_chance = [
        [0, 1, 2],   # Chance node 1 has max nodes 1, 2, 3
        [3, 4, 5],   # Chance node 2 has max nodes 4, 5, 6
        [6, 7, 8]    # Chance node 3 has max nodes 7, 8, 9
    ]
    
    # Non-uniform probabilities for chance nodes
    probabilities = [0.5, 0.25, 0.25]
    
    print("\n======= Q3b: EXPECTIMAX (NON-UNIFORM PROBABILITIES) =======\n")
    print(f"Probabilities: leftmost={probabilities[0]}, middle={probabilities[1]}, rightmost={probabilities[2]}")
    
    # Compute max node values
    max_node_values = []
    for pair in leaf_pairs:
        max_value = max(pair)
        max_node_values.append(max_value)
    
    print("\nMAX NODE VALUES (TRAPEZOIDS):")
    for i, value in enumerate(max_node_values):
        print(f"  Max Node {i+1}: max{leaf_pairs[i]} = {value}")
    
    # Compute chance node values with non-uniform probabilities
    chance_node_values = []
    for chance_children in max_nodes_by_chance:
        child_values = [max_node_values[i] for i in chance_children]
        expected_value = sum(v * p for v, p in zip(child_values, probabilities))
        chance_node_values.append(expected_value)
    
    print("\nCHANCE NODE VALUES (CIRCLES):")
    for i, value in enumerate(chance_node_values):
        child_indices = max_nodes_by_chance[i]
        child_values = [max_node_values[j] for j in child_indices]
        print(f"  Chance Node {i+1}: weighted_avg{child_values} with {probabilities} = {value:.2f}")
    
    # Compute root value (max)
    root_value = max(chance_node_values)
    best_chance_index = chance_node_values.index(root_value)
    
    print(f"\nROOT VALUE (MAX): max{[f'{v:.2f}' for v in chance_node_values]} = {root_value:.2f}")
    print(f"Optimal move: Choose Chance Node {best_chance_index + 1}")
    
    # Print the expectimax tree
    print("\nEXPECTIMAX TREE (NON-UNIFORM PROBABILITIES):\n")
    print(f"                         Root (MAX): {root_value:.2f}")
    print(f"                      /      |      \\")
    print(f"                     /       |       \\")
    print(f"        Chance:  {chance_node_values[0]:.2f}     {chance_node_values[1]:.2f}     {chance_node_values[2]:.2f}")
    print(f"                / | \\    / | \\    / | \\")
    
    # Print max nodes in groups of 3
    max_str = "  Max:    "
    for i in range(9):
        max_str += f"{max_node_values[i]}   "
        if i % 3 == 2 and i < 8:
            max_str += "  "
    print(max_str)
    
    # Print leaf values
    leaf_str = "  Leaves: "
    for i, pair in enumerate(leaf_pairs):
        leaf_str += f"{pair}  "
        if i % 3 == 2 and i < 8:
            leaf_str += " "
    print(leaf_str)
    
    print("\n==================================================\n")
    
    return {
        "max_node_values": max_node_values,
        "chance_node_values": chance_node_values,
        "root_value": root_value
    }

if __name__ == "__main__":
    expectimax_uniform()
    expectimax_non_uniform()