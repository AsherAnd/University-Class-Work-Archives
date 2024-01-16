from WeightedGraph import WeightedGraph


class WeightedTree(WeightedGraph):
    """
    WeightedTree objects are WeightedGraphs that are trees.
    They are internally represented using modified adjacency matrices where each entry a(i,j) is either
    - 0 if there is no edge between vertices i and j
    - a positive integer representing the weight of the edge between i and j if there is such an edge
    Note that the graph is simple and therefore the adjacency matrix representation is symmetric
    """

    ###########################  DO NOT MODIFY THESE FUNCTIONS  ####################################

    def __init__(self, vertices, edges):
        self.inPath = [
            0
        ] * vertices  # used to check for an existing path between 2 vertices
        super().__init__(vertices, edges)

    def __init__(self, vertices):
        self.inPath = [
            0
        ] * vertices  # used to check for an existing path between 2 vertices
        edges = []
        for i in range(vertices):
            edges.append(list([0] * vertices))
        super().__init__(vertices, edges)

    @classmethod
    def fromFile(cls, filename):
        """
        Instantiates a WeightedGraph read from a file.
        See the description of WeightedGraph.readGraph for the file format.

        Parameters:
            str filename: name of file containing the graph

        Returns a WeightedGraph described by the file.
        """
        vertices, edges = WeightedGraph.readGraph(filename)
        return WeightedTree(vertices, edges)

    ###########################  START YOUR CODE HERE  ####################################

    @classmethod
    def MSTfromGraph(cls, graph):
        """
              Creates a WeightedTree that is a MST of graph.

        Parameters:
            WeightedGraph graph: graph whose MST will be computed

        Returns a WeightedTree MST for the graph, or None if this is not possible.
        """
        if graph is None:
            return None

        if not graph.isConnected():
            return None

        edge_list = cls.sortEdges(graph)
        tree = WeightedTree(graph.totalVertices())

        for edge in edge_list:
            if (WeightedTree.canAdd(tree, edge)) == True:
                tree.addEdge(edge)

        return tree

    @classmethod
    def sortEdges(cls, graph):
        """
              Sort the edges of the graph in order of increasing weight

        Parameters:
            WeightedGraph graph: graph whose edges will be sorted

        Returns a sorted list of the edges of the graph.
        Each edge is a triple of format (weight, v1, v2)
        """
        edge_list = []
        rows = graph.totalVertices()
        cols = len(graph.getEdges()[0])

        for row in range(rows):
            for col in range(cols):
                edge = [graph.getEdge(col, row), col, row]

                if graph.edges[row][col] != 0 and edge not in edge_list:
                    edge_list.append([graph.getEdge(row, col), row, col])

        edge_list.sort(key=lambda x: x[0])
        return edge_list

    def canAdd(self, newedge):
        """
        Checks whether a new edge can be added to self without introducing a cycle

        Parameters:
            triple newedge: edge that could be added.  Its format is (weight,v1,v2)

        Returns True if newedge can be added to self without introducing a cycle, and False otherwise
        """

        def hasCycle(tree, vertex, root):
            # set the current vertex to be visited, because we start from here
            tree.visitedV[vertex] = True

            # loop through the neighboring edges of the current vertex using the adjacency matrix
            for neighbor in range(len(tree.edges[vertex])):
                # get the current weight
                weight = tree.edges[vertex][neighbor]
                # if the weight is 0, that means there is no edge connecting the vertex and neighbor
                if weight != 0:
                    # neighbor not visited before, start a recursive call
                    if not tree.visitedV[neighbor]:
                        if hasCycle(tree, neighbor, vertex):
                            return True
                    # neighbor has been visited before, but is not the root which indicates a cycle
                    elif neighbor != root:
                        return True

            return False

        temp = WeightedTree(self.totalV)
        temp.edges = self.getEdges()
        temp.addEdge(newedge)
        temp.clearVisited()

        for vertex in range(len(temp.edges)):
            if not temp.visitedV[vertex]:
                if hasCycle(temp, vertex, -420):
                    return False
        return True

    def isPath(self, i, j):
        """
        Determines whether there is a path from i to j in self
        by trying to find such a path recursively, backtracking when necessary

        Parameters:
            int i,j: vertices in self which may or may not be connected

        Returns True if self contains a path from i to j, and False otherwise

        Side-Effect:
            self.inPath[] is used and modified by this method as follows (where v is a vertex):
            - self.inPath[v] = 0 when self does not include any edges ajacent to v yet
            - self.inPath[v] = 1 when self does include at least one edge adjacent to v,
                            but v is not yet part of the path
            - self.inPath[v] = 2 when self does include at least one edge adjacent to v,
                            and v is already part of the path
        """
        return True

    def addEdge(self, newedge):
        """
        Adds a new edge to self

        Parameters:
            triple newedge: edge that will be added.  Its format is (weight,v1,v2)

        Returns nothing
        """
        self.edges[newedge[1]][newedge[2]] = newedge[0]
        self.edges[newedge[2]][newedge[1]] = newedge[0]

        if newedge[0] >= 1:
            self.totalE += 1
            self.totalW += newedge[0]

    ###########################  COPY YOUR LAB6 CODE FOR THESE FUNCTIONS  ####################################

    def isTree(self):
        """
        Checks whether self is tree

        Returns True if self is a tree, and False otherwise
        """
        return (
            self.totalVertices() - 1 == self.totalEdges() and self.isConnected()
        ) or (self.totalVertices == 1)

    def isSpanningtree(self, graph):
        """
        Checks whether self is a spanning tree of a graph

        Parameters:
            int graph: WeightedGraph that may have self as a spanning tree

        Assumptions:
            the vertices have the same numbering in both graphs

        Returns True if self is a spanning tree of graph, and False otherwise
        """
        return self.isTree() and self.isSubgraph(graph)
