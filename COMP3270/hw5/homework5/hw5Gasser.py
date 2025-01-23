'''
COMP 3270 Intro to Algorithms Homework 5 coding section
requires networkx, argparse
requires python 3.6+ (can get with anaconda or elsewhere, note standard python with mac is python 2)
pip install networkx
pip install argparse
'''

import argparse
import networkx as nx
import pickle
import matplotlib.pyplot as plt

parser = argparse.ArgumentParser()
parser.add_argument("--start", type=str, help="Start node for Dijkstra's")
parser.add_argument("--end", type=str, help="End node for Dijkstra's")
args = parser.parse_args()


'''
Problem 1
Implement the indexed priority queue data structure backed by a list based min-heap 
and a dict based index.
Hint: if you store a binary tree in a vector with each new element being the final
element in the vector representing the last leaf node at the deepest level, you can
compute the index of the children of the node at position i as 2i+1 and 2i+2
You cannot import Queue or any other package for this problem.
'''
class IndexedPriorityQueue:
    def __init__(self):
        self.min_heap = []
        self.index = {}

    def push(self, key, value):
        self.min_heap.append((value, key))
        self.index[key] = len(self.min_heap) - 1
        self.__heapify_up(len(self.min_heap) - 1)

    def popmin(self):
        min_value, min_key = self.min_heap[0]
        last_element = self.min_heap.pop()
        if self.min_heap:
            self.min_heap[0] = last_element
            self.index[last_element[1]] = 0
            self.__heapify_down(0)
        del self.index[min_key]
        return min_key, min_value

    def peek(self):
        return self.min_heap[0][1], self.min_heap[0][0]

    def decrease_key(self, key, new_value):
        index = self.index[key]
        self.min_heap[index] = (new_value, key)
        self.__heapify_up(index)

    def __heapify_up(self, idx):
        while idx > 0:
            parent_idx = (idx - 1) // 2
            if self.min_heap[idx][0] < self.min_heap[parent_idx][0]:
                self.__swap(idx, parent_idx)
                idx = parent_idx
            else:
                break

    def __heapify_down(self, idx):
        size = len(self.min_heap)
        while idx < size:
            left_child = 2 * idx + 1
            right_child = 2 * idx + 2
            smallest = idx

            if left_child < size and self.min_heap[left_child][0] < self.min_heap[smallest][0]:
                smallest = left_child
            if right_child < size and self.min_heap[right_child][0] < self.min_heap[smallest][0]:
                smallest = right_child

            if smallest != idx:
                self.__swap(idx, smallest)
                idx = smallest
            else:
                break

    def __swap(self, i, j):
        self.min_heap[i], self.min_heap[j] = self.min_heap[j], self.min_heap[i]
        self.index[self.min_heap[i][1]] = i
        self.index[self.min_heap[j][1]] = j





'''
Problem 2
Dijkstras minimum path from s to t
You should use the Indexed priority queue from problem 1
'''
def Dijkstras(G, s, t):
    distances = {node: float('inf') for node in G.nodes}
    distances[s] = 0
    prev = {node: None for node in G.nodes}
    ipq = IndexedPriorityQueue()

    for node, dist in distances.items():
        ipq.push(node, dist)

    while ipq.min_heap:
        current_node, current_distance = ipq.popmin()
        if current_node == t:
            break
        for neighbor in G.neighbors(current_node):
            weight = G[current_node][neighbor]['weight']
            new_distance = current_distance + weight
            if new_distance < distances[neighbor]:
                distances[neighbor] = new_distance
                prev[neighbor] = current_node
                ipq.decrease_key(neighbor, new_distance)

    path = []
    current = t
    while current:
        path.insert(0, current)
        current = prev[current]

    pos = nx.spring_layout(G)
    nx.draw(G, pos, with_labels=True, node_color="lightblue", edge_color="gray", node_size=500)
    nx.draw_networkx_edges(
        G, pos,
        edgelist=[(path[i], path[i + 1]) for i in range(len(path) - 1)],
        edge_color="red", width=2
    )
    plt.savefig("graph.png")

    with open("distances.pkl", "wb") as f:
        pickle.dump(distances, f)
    with open("path.pkl", "wb") as f:
        pickle.dump(path, f)

    return distances, path






# make graph and run functions

G = nx.Graph()
G.add_nodes_from([x for x in "abcdef"])
G.add_edge("a","b", weight=14)
G.add_edge("a","c", weight=9)
G.add_edge("a","d", weight=7)
G.add_edge("b","c", weight=2)
G.add_edge("b","e", weight=9)
G.add_edge("c","d", weight=10)
G.add_edge("c","f", weight=11)
G.add_edge("d","f", weight=15)
G.add_edge("e","f", weight=6)

start_node = args.start
end_node = args.end

if start_node == None and end_node == None:
    print("Please refer to the argument usage: hw5Gasser.py -h")
elif start_node not in G.nodes or end_node not in G.nodes:
    print("ERROR: provided start or end node is not contained in graph")
else:
    Dijkstras(G, start_node, end_node)
    print(f"Shortest path highlighted in red in graph.png :3")

