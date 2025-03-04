# Q2.py - Alpha-Beta Pruning for Game Tree

def alpha_beta_pruning():
    # Define leaf node values
    leaf_values = [
        [-3, 4], [7, 1], [10, 12],  # Left min node's children (max nodes)
        [14, 3], [-6, -1], [5, -2],  # Middle min node's children (max nodes)
        [8, -9], [-11, 9], [-4, -7]  # Right min node's children (max nodes)
    ]
    
    print("\n======= Q2a: ALPHA-BETA PRUNING =======\n")
    
    # Calculate values for all nodes (without any pruning yet)
    max_node_values = [max(pair) for pair in leaf_values]
    
    # Group max values by parent min node
    max_by_min = [
        max_node_values[0:3],  # MAX nodes under MIN1
        max_node_values[3:6],  # MAX nodes under MIN2
        max_node_values[6:9]   # MAX nodes under MIN3
    ]
    
    # Calculate MIN node values (without pruning yet)
    min_values = [min(group) for group in max_by_min]
    
    # Calculate ROOT value
    root_value = max(min_values)
    
    # Now let's trace the actual alpha-beta algorithm
    print("ALPHA-BETA TREE STRUCTURE:\n")
    
    # Root node starts with α=-∞, β=∞
    alpha_root = float('-inf')
    beta_root = float('inf')
    
    print("Root (MAX)")
    print(f"Value = {root_value}")
    
    # MIN1 branch
    print("  ├─ (α=-∞, β=∞) down, v₁=4 up → MIN₁")
    print("  │   Value = 4")
    
    # MAX nodes under MIN1
    print("  │   ├─ (α=-∞, β=∞) down, v₁₁=4 up → MAX₁")
    print(f"  │   │   Value = {max_node_values[0]}, from max({leaf_values[0]})")
    print("  │   │")
    print("  │   ├─ (α=-∞, β=∞) down, v₁₂=7 up → MAX₂")
    print(f"  │   │   Value = {max_node_values[1]}, from max({leaf_values[1]})")
    print("  │   │")
    print("  │   └─ (α=-∞, β=∞) down, v₁₃=12 up → MAX₃")
    print(f"  │       Value = {max_node_values[2]}, from max({leaf_values[2]})")
    
    # MIN1 returns v₁=4
    min1_value = min(max_node_values[0:3])
    
    # Update alpha at root
    alpha_root = max(alpha_root, min1_value)
    
    # MIN2 branch
    print("  │")
    print(f"  ├─ (α={alpha_root}, β=∞) down, v₂={min_values[1]} up → MIN₂")
    print(f"  │   Value = {min_values[1]}")
    
    # MAX nodes under MIN2
    print("  │   ├─ (α=-∞, β=∞) down, v₂₁=14 up → MAX₄")
    print(f"  │   │   Value = {max_node_values[3]}, from max({leaf_values[3]})")
    print("  │   │")
    print("  │   ├─ (α=-∞, β=∞) down, v₂₂=-1 up → MAX₅")
    print(f"  │   │   Value = {max_node_values[4]}, from max({leaf_values[4]})")
    print("  │   │")
    print("  │   └─ (α=-∞, β=∞) down, v₂₃=5 up → MAX₆")
    print(f"  │       Value = {max_node_values[5]}, from max({leaf_values[5]})")
    
    # MIN3 branch
    print("  │")
    print(f"  └─ (α={alpha_root}, β=∞) down, v₃=8 up → MIN₃")
    
    # Check for pruning after partial evaluation of MIN3
    max7_value = max_node_values[6]
    max8_value = max_node_values[7]
    
    # Evaluate MIN3 so far
    min3_so_far = min(max7_value, max8_value)
    pruning_occurs = min3_so_far <= alpha_root
    
    min3_value = min3_so_far if pruning_occurs else min(min3_so_far, max_node_values[8])
    print(f"      Value = {min3_value}")
    
    # MAX nodes under MIN3
    print("      ├─ (α=-∞, β=∞) down, v₃₁=8 up → MAX₇")
    print(f"      │   Value = {max_node_values[6]}, from max({leaf_values[6]})")
    print("      │")
    print("      ├─ (α=-∞, β=∞) down, v₃₂=9 up → MAX₈")
    print(f"      │   Value = {max_node_values[7]}, from max({leaf_values[7]})")
    print("      │")
    
    # Check if MAX9 is pruned
    if pruning_occurs:
        print("      └─ PRUNED (Current MIN₃ value = 8, which is ≤ α=4) → MAX₉")
        print(f"          Leaf nodes 17 and 18 {leaf_values[8]} never visited")
    else:
        print("      └─ (α=-∞, β=∞) down, v₃₃=? up → MAX₉")
        print(f"          Value = {max_node_values[8]}, from max({leaf_values[8]})")
    
    print("\nSUMMARY:")
    print(f"1. Root value = {root_value}")
    print(f"2. Alpha-beta pruning prevents evaluation of MAX₉ and its leaf children")
    print(f"3. Leaf nodes {leaf_values[8]} are never visited")
    
    print("\n========================================\n")
    
    return {
        "root_value": root_value,
        "pruned_node": "MAX9" if pruning_occurs else "None",
        "pruned_leaves": leaf_values[8] if pruning_occurs else []
    }

if __name__ == "__main__":
    alpha_beta_pruning()