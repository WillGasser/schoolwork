# Q1.py - Minimax Search for Game Tree

def minimax_search():
    # Define leaf node values from the image
    leaf_values = [
        [-3, 4], [7, 1], [10, 12],  # Left min node's children (max nodes)
        [14, 3], [-6, -1], [5, -2],  # Middle min node's children (max nodes)
        [8, -9], [-11, 9], [-4, -7]  # Right min node's children (max nodes)
    ]
    
    print("\n======= Q1a: MINIMAX SEARCH =======\n")
    
    # Calculate level 2 values (max nodes)
    level2_values = []
    for pair in leaf_values:
        level2_values.append(max(pair))
    
    # Organize max values into the structure of the game tree
    level2_by_parent = [
        level2_values[0:3],  # Left min node's children
        level2_values[3:6],  # Middle min node's children
        level2_values[6:9]   # Right min node's children
    ]
    
    # Calculate level 1 values (min nodes)
    level1_values = []
    for values in level2_by_parent:
        level1_values.append(min(values))
    
    # Calculate root value (max node)
    root_value = max(level1_values)
    
    # Determine best move
    best_move_index = level1_values.index(root_value)
    best_move = ["left", "middle", "right"][best_move_index]
    
    # Print the tree
    print("Minimax Tree Values:\n")
    print(f"                           Root (MAX): {root_value}")
    print(f"                             /    |    \\")
    print(f"                            /     |     \\")
    print(f"                           /      |      \\")
    print(f"         Min Nodes:     {level1_values[0]}      {level1_values[1]}       {level1_values[2]}")
    print(f"                       / | \\   / | \\   / | \\")
    
    # Max nodes (level 2)
    print("Max Nodes:   ", end="")
    for i, value in enumerate(level2_values):
        print(f"{value}", end="   ")
        if i == 2 or i == 5:
            print("  ", end="")
    print()
    
    # Leaf nodes
    print("Leaf Values: ", end="")
    for i, pair in enumerate(leaf_values):
        print(f"{pair[0]},{pair[1]}", end=" ")
        if i == 2 or i == 5:
            print("  ", end="")
    print("\n")
    
    print(f"Best move: {best_move}")
    print(f"Game value: {root_value}")
    print("\n========================================\n")
    
    return {
        "level2_values": level2_values,
        "level1_values": level1_values,
        "root_value": root_value
    }

if __name__ == "__main__":
    minimax_search()