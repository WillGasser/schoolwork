'''
COMP 3270 Intro to Algorithms Homework 4 coding section
requires networkx, argparse, and chess 
requires python 3.6+ (can get with anaconda or elsewhere, note standard python with mac is python 2)
pip install networkx
pip install argparse
pip install chess
'''


'''######################################
 COMMAND LINE 

python3 homework4Gasser.py --graph1 maze.adjlist --start_node1 "(0,0)" --end_node1 "(4,4)" --graph2 chess_movetree.pickle

#########################################'''



import argparse
import chess
import networkx as nx
import pickle
from collections import deque

parser = argparse.ArgumentParser()
parser.add_argument("--graph1", help="file containing graph in adjacency list format for problem 1", required=True)
parser.add_argument("--start_node1", help="name of start node for problem 1", required=True)
parser.add_argument("--end_node1", help="name of end node for problem 1", required=True)
parser.add_argument("--graph2", help="file containing graph in pickle format", required=True)
args = parser.parse_args()
'''
Problem 1
Traverses maze graph G (networkx Graph) in a DFS manner. You may make a helper function
for networkx graphs, you iterate over the adjacent nodes with
for neighbor in G[node_name]:

and you can store and access arbitrary information in nodes with 
G.nodes[node_name][attribute_name]

Keep track of the previous node in the path such that you can output the node path from start to end
node names are (x,y) denoting locations in the maze
outputs: prints path from start_node to end_node
'''
def maze(G, start_node: str, end_node: str, pathStack=None):
    if pathStack is None:
        pathStack = []
    
    pathStack.append(start_node)
    
    if start_node == end_node:
        print("Path from start to end node:")
        for node in pathStack:
            print(node)   
        return 
               
    
    for neighbor in G[start_node]:
        if neighbor not in pathStack:  
            maze(G, neighbor, end_node, pathStack)
    
    pathStack.pop()  
    return   





'''
Problem 2
Traverse the chess move graph G (networkx Graph) in a BFS manner until you find the fastest checkmate
node names are a text representation of the state of the game including board position
you can print out the position with print(chess.Board(node_name))

node objects contain there parent node name accessed by G.nodes[node_name]['parent']
node objects contain the move that led to this position which is accessed by G.nodes[node_name]['move'] (this is None for the starting position)

you can check whether a position is checkmate via the following code
board = chess.Board(node_name)
if board.is_checkmate():
    #do something
    
outputs: prints move sequence to fastest possible checkmate
'''
def checkmate(G, start_node: str):
    queue = deque([(start_node, [])])
    visited = set()
    
    while queue:
        current_node, path = queue.popleft()
        
        board = chess.Board(current_node)
        
        if board.is_checkmate():
            print('Checkmate combination:')
            for move in path:
                print(move)
            return
        
        visited.add(current_node)
        
        for neighbor in G.neighbors(current_node):
            if neighbor not in visited:
                visited.add(neighbor) 
                new_move = G.nodes[neighbor]['move']
                queue.append((neighbor, path + [new_move]))


# load graphs and run functions
maze_graph = nx.read_adjlist(args.graph1)
maze(maze_graph, args.start_node1, args.end_node1)

chess_movetree = pickle.load(open(args.graph2,'rb'))
start_node = chess.Board().fen() # node name for the starting game position
checkmate(chess_movetree, start_node)




