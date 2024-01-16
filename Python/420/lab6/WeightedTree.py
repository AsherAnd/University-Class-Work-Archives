from WeightedGraph import WeightedGraph


class WeightedTree(WeightedGraph):
    """
    WeightedTree objects are WeightedGraphs that are trees.
    They are internally represented using modified adjacency matrices where each entry a(i,j) is either
    - 0 if there is no edge between vertices i and j
    - a positive integer representing the weight of the edge between i and j if there is such an edge
    Note that the graph is simple and therefore the adjacency matrix representation is symmetric
    """

    ###########################  DO NOT MODIFY CODE IN THIS SECTION  ####################################

    @classmethod
    def fromFile(cls, filename):
        """
              Instantiates a WeightedTree read from a file.
        The file has exactly the same format as a WeightedGraph.

              Parameters:
            str filename: name of file containing the tree

        Returns a WeightedTree described in the file.
        """
        vertices, edges = WeightedGraph.readGraph(filename)
        return WeightedTree(vertices, edges)

    def __init__(self, vertices, edge):
        super().__init__(vertices, edge)

    ###########################  ONLY MODIFY CODE AFTER THIS LINE  ####################################

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
