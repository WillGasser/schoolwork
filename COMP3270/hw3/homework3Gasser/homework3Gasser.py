'''
COMP 3270 coding section
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
parser.add_argument("--graph", help="file containing graph in pickle format for problem 1")
args = parser.parse_args()

'''
Problem 1
Implement the disjoint-set / union-find data structure with path compression
'''
class DisjointSet:
    def __init__(self):
        self.parent = {}

    def makeset(self, v):
        if v not in self.parent:
            self.parent[v] = v

    def find(self, v):
        if self.parent[v] != v:
            self.parent[v] = self.find(self.parent[v])  
        return self.parent[v]

    def union(self, x, y):
        rootX = self.find(x)
        rootY = self.find(y)
        
        if rootX != rootY:
            self.parent[rootY] = rootX 

'''
Problem 2
find the minimum spanning tree of G using your disjoint set data structure above
then draw the graph with the edges in the MST twice as thick as the other edges and save that to mst.png

some code I used to draw the graph
edge_labels = nx.get_edge_attributes(G, "weight") # get edge labels
pos = nx.spring_layout(G) # get position of nodes with a spring model layout
nx.draw_networkx_edges(G, pos)
nx.draw_networkx_nodes(G, pos)
nx.draw_networkx_labels(G, pos)
nx.draw_networkx_edge_labels(G, pos, edge_labels)

plt.axis("off")
plt.savefig('graph.png')
'''
def kruskal(G):
    E = sorted(G.edges(data=True), key=lambda e: e[2]['weight'])
    disjoint_set = DisjointSet()
    mst_edges = []

    for v in G.nodes:
        disjoint_set.makeset(v)

    for x, y, e in E:
        root_x = disjoint_set.find(x)
        root_y = disjoint_set.find(y)
        
        if root_x != root_y:
            mst_edges.append((x, y, e['weight']))
            disjoint_set.union(x, y)
    
    return mst_edges

def draw_graph(G, mst_edges):
    pos = nx.spring_layout(G)
    edge_labels = nx.get_edge_attributes(G, "weight")

    nx.draw_networkx_edges(G, pos, edge_color='gray', alpha=0.5)

    nx.draw_networkx_edges(G, pos, edgelist=mst_edges, width=2, edge_color='red')

    nx.draw_networkx_nodes(G, pos)
    nx.draw_networkx_labels(G, pos)
    nx.draw_networkx_edge_labels(G, pos, edge_labels)

    plt.axis("off")
    plt.savefig('mst.png')

# load graphs and run functions

graph = pickle.load(open('graph.pickle','rb'))  
mst_edges = kruskal(graph)

draw_graph(graph, mst_edges)