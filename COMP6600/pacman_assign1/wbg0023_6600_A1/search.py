# search.py
# ---------
# Licensing Information:  You are free to use or extend these projects for
# educational purposes provided that (1) you do not distribute or publish
# solutions, (2) you retain this notice, and (3) you provide clear
# attribution to UC Berkeley, including a link to http://ai.berkeley.edu.
# 
# Attribution Information: The Pacman AI projects were developed at UC Berkeley.
# The core projects and autograders were primarily created by John DeNero
# (denero@cs.berkeley.edu) and Dan Klein (klein@cs.berkeley.edu).
# Student side autograding was added by Brad Miller, Nick Hay, and
# Pieter Abbeel (pabbeel@cs.berkeley.edu).


"""
In search.py, you will implement generic search algorithms which are called by
Pacman agents (in searchAgents.py).
"""

import util
from game import Directions
from typing import List

class SearchProblem:
    """
    This class outlines the structure of a search problem, but doesn't implement
    any of the methods (in object-oriented terminology: an abstract class).

    You do not need to change anything in this class, ever.
    """

    def getStartState(self):
        """
        Returns the start state for the search problem.
        """
        util.raiseNotDefined()

    def isGoalState(self, state):
        """
          state: Search state

        Returns True if and only if the state is a valid goal state.
        """
        util.raiseNotDefined()

    def getSuccessors(self, state):
        """
          state: Search state

        For a given state, this should return a list of triples, (successor,
        action, stepCost), where 'successor' is a successor to the current
        state, 'action' is the action required to get there, and 'stepCost' is
        the incremental cost of expanding to that successor.
        """
        util.raiseNotDefined()

    def getCostOfActions(self, actions):
        """
         actions: A list of actions to take

        This method returns the total cost of a particular sequence of actions.
        The sequence must be composed of legal moves.
        """
        util.raiseNotDefined()




def tinyMazeSearch(problem: SearchProblem) -> List[Directions]:
    """
    Returns a sequence of moves that solves tinyMaze.  For any other maze, the
    sequence of moves will be incorrect, so only use this for tinyMaze.
    """
    s = Directions.SOUTH
    w = Directions.WEST
    return  [s, s, w, s, w, w, s, w]

def depthFirstSearch(problem: SearchProblem) -> List[Directions]:
    """
    Search the deepest nodes in the search tree first.

    Your search algorithm needs to return a list of actions that reaches the
    goal. Make sure to implement a graph search algorithm.

    To get started, you might want to try some of these simple commands to
    understand the search problem that is being passed in:

    print("Start:", problem.getStartState())
    print("Is the start a goal?", problem.isGoalState(problem.getStartState()))
    print("Start's successors:", problem.getSuccessors(problem.getStartState()))
    """
    # use a stack for LIFO
    fringe = util.Stack()
    visited = set() # easy visited set to check
    # we are pusing (state, actions) so we can see actions as list of moves
    fringe.push((problem.getStartState(), []))
    # so here while we still have actions in the fringe pop them
    while not fringe.isEmpty():
        state, actions = fringe.pop()

        # skip if in set visited
        if state in visited:
            continue

        # then mark as visited so in next while loop iteration we skip
        visited.add(state)

        # just check simple isGoalState(state) with bool output
        if problem.isGoalState(state):
            return actions

        # so for each successor/action we haven't seen just add to fringe to be explored
        # this is the DFS element basically we are looking DEPTH 
        for successor, action, stepCost in problem.getSuccessors(state):
            if successor not in visited:
                fringe.push((successor, actions + [action]))

    # no solution
    return []

def breadthFirstSearch(problem: SearchProblem) -> List[Directions]:
    """Search the shallowest nodes in the search tree first."""
    # use queue util for FIFO
    fringe = util.Queue()
    # same thing as before set for state management
    visited = set()
    fringe.push((problem.getStartState(), []))

    while not fringe.isEmpty():
        state, actions = fringe.pop()

        # same 
        if state in visited:
            continue

        # same
        visited.add(state)

        # same
        if problem.isGoalState(state):
            return actions

        # same just fifo
        for successor, action, stepCost in problem.getSuccessors(state):
            if successor not in visited:
                fringe.push((successor, actions + [action]))

    return []

def uniformCostSearch(problem: SearchProblem) -> List[Directions]:
    """Search the node of least total cost first."""
    # use priority queue just so we can get that least cost
    fringe = util.PriorityQueue()
    # same thing here just another set to prevent duplicate states
    visited = set()
    # make a simple base case with parameter: (state, actions, cost)
    fringe.push((problem.getStartState(), [], 0), 0)

    while not fringe.isEmpty():
        state, actions, cost = fringe.pop()

        # again, skip if already in visited set
        if state in visited:
            continue

        # again add the state to visited set, self explanatory by now
        visited.add(state)

        # same
        if problem.isGoalState(state):
            return actions

        # This is really similar but it's our main difference between BFS/DFS implementations
        for successor, action, stepCost in problem.getSuccessors(state):
            if successor not in visited:
                new_cost = cost + stepCost  
                # /\/\/\/\/\ above you can see for each unvisited successor we calculate the cumulative cost and add to PQ 
                # NOW PQ ensures that the successor with the lowest total cost is expanded next
                fringe.push((successor, actions + [action], new_cost), new_cost)

    return []


def nullHeuristic(state, problem=None) -> float:
    """
    A heuristic function estimates the cost from the current state to the nearest
    goal in the provided SearchProblem.  This heuristic is trivial.
    """
    return 0

def aStarSearch(problem: SearchProblem, heuristic=nullHeuristic) -> List[Directions]:
    """Search the node that has the lowest combined cost and heuristic first."""
    # we have another PQ but we use a different function than UCS which is : f = g + h
    fringe = util.PriorityQueue()
    start_state = problem.getStartState()
    
    # set our initial cost as the init state which is always 0, no cost to start!
    best_cost = {start_state: 0}
    
    # push the start state with priority = 0 because again no cost to start, but look we use heuristic here !
    fringe.push((start_state, [], 0), heuristic(start_state, problem)) 

    while not fringe.isEmpty():
        # so now we look in our PQ and take that top least cost based on our heuristic
        # starting its just the base case, but as we iterate it becomes the least cost heuristic element
        state, actions, cost = fringe.pop()

        # if or current best_cost is better than the popped cost, we just continue, best_cost is locally optimized for this iteration
        if state in best_cost and cost > best_cost[state]:
            continue

        # again just check for goal
        if problem.isGoalState(state):
            return actions

        # same as UCS for this first part just remember popped element is based on heuristic not FIFO/LIFO 
        for successor, action, stepCost in problem.getSuccessors(state):
            new_cost = cost + stepCost
            
            # now just check if a better path to the successor, update best_cost and push to fringe
            if successor not in best_cost or new_cost < best_cost[successor]:  
                best_cost[successor] = new_cost # see we update our best_cost here, when optimized we continue through the loop until we meet goal
                priority = new_cost + heuristic(successor, problem) # then the priority for that fring push becomes cost + heuristic
                fringe.push((successor, actions + [action], new_cost), priority) # simple push to PQ

    return []  

# Abbreviations
bfs = breadthFirstSearch
dfs = depthFirstSearch
astar = aStarSearch
ucs = uniformCostSearch
