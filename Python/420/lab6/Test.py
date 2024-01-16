from WeightedGraph import WeightedGraph
from WeightedTree import WeightedTree

dirPath = "/home/cps420/public_html/doc/Now/Lab6/Tests/"


def main():
    """
    COPYRIGHT SOPHIE QUIGLEY 2023
    THIS FILE IS NOT TO BE MODIFIED, CIRCULATED, OR POSTED WITHOUT THE PERMISSION OF SOPHIE QUIGLEY

    Main test program calculates score for program.
    """
    score = 0

    # Run test files to check isSubgraph
    print(
        "\n=======================  TEST ISSUBGRAPH (out of 15)  ======================="
    )

    score += testIsSubgraph("fullgraph2", "fullgraph2", True, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph2-1", "fullgraph2", True, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph2-2", "fullgraph2", False, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("fullgraph5", "fullgraph5", True, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("fullgraph4", "fullgraph5", True, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph5-1", "fullgraph5", True, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph5-2", "fullgraph5", True, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph5-3", "fullgraph5", False, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph6", "fullgraph5", False, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph10-1", "graph10", True, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph10-2", "graph10", False, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph15-1", "graph20", True, 2)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSubgraph("graph15-2", "graph20", False, 2)
    print("         Score so far: " + str(score) + " out of 13.")

    # Run test files to check isTree
    print(
        "\n=======================  TEST ISTREE (out of 15)   ======================="
    )

    score += testIsTree("tree1", True, 1)
    print("         Score so far: " + str(score) + " out of 30.")
    score += testIsTree("fullgraph2", True, 1)
    print("         Score so far: " + str(score) + " out of 30.")
    score += testIsTree("graph2-1", False, 1)
    print("         Score so far: " + str(score) + " out of 30.")
    score += testIsTree("tree4", True, 1)
    print("         Score so far: " + str(score) + " out of 30.")
    score += testIsTree("graph4-1", False, 1)
    print("         Score so far: " + str(score) + " out of 30.")
    score += testIsTree("graph5-3", False, 1)
    print("         Score so far: " + str(score) + " out of 30.")
    score += testIsTree("graph5-4", False, 1)
    print("         Score so far: " + str(score) + " out of 30.")
    score += testIsTree("tree10-1", True, 3)
    print("         Score so far: " + str(score) + " out of 30.")
    score += testIsTree("graph10-3", False, 3)
    print("         Score so far: " + str(score) + " out of 30.")
    score += testIsTree("graph10-4", False, 2)
    print("         Score so far: " + str(score) + " out of 30.")

    # Run test files to check isSpanningtree
    print(
        "\n=======================  TEST ISSPANNINGTREE (out of 10)   ======================="
    )

    score += testIsSpanningtree("tree1", "tree1", True, 1)
    print("         Score so far: " + str(score) + " out of 40.")
    score += testIsSpanningtree("fullgraph2", "fullgraph2", True, 1)
    print("         Score so far: " + str(score) + " out of 40.")
    score += testIsSpanningtree("graph2-2", "fullgraph2", False, 1)
    print("         Score so far: " + str(score) + " out of 40.")
    score += testIsSpanningtree("tree4", "fullgraph4", True, 1)
    print("         Score so far: " + str(score) + " out of 40.")
    score += testIsSpanningtree("graph4-1", "fullgraph4", False, 1)
    print("         Score so far: " + str(score) + " out of 40.")
    score += testIsSpanningtree("graph10-1", "graph10", False, 1)
    print("         Score so far: " + str(score) + " out of 15.")
    score += testIsSpanningtree("tree10-1", "fullgraph10", True, 2)
    print("         Score so far: " + str(score) + " out of 40.")
    score += testIsSpanningtree("tree10-2", "fullgraph10", False, 2)
    print("         Score so far: " + str(score) + " out of 40.")

    # Print final score
    print("Final score: " + str(score) + " out of 40.")


def testIsSubgraph(graph1file, graph2file, expected, outof):
    """
    Reads graphs from files and tests whether the first is a subgraph of the second,
    assuming that the vertices are numbered the same way.

    Parameters:
      str graph1file, graph2file: names of files containing two graphs to be tested
      boolean expected: expected result for that test
      int outof: value of correct answer towards score

    Returns outof if test passed, 0 otherwise
    """
    print(
        "-------  Test whether "
        + graph1file
        + " is a subgraph of "
        + graph2file
        + " for "
        + str(outof)
        + " points -------"
    )
    graph1 = WeightedGraph.fromFile(dirPath + graph1file)
    graph2 = WeightedGraph.fromFile(dirPath + graph2file)
    return compare(graph1.isSubgraph(graph2), expected, outof)


def testIsTree(treefile, expected, outof):
    """
    Reads a graph from a files and tests whether it is a tree,
    assuming that the vertices are numbered the same way.

    Parameters:
      str treefile: name of file containing tree
      boolean expected: expected result for that test
      int outof: value of correct answer towards score

    Returns outof if test passed, 0 otherwise
    """
    print(
        "-------  Test whether "
        + treefile
        + " is a tree for "
        + str(outof)
        + " points -------"
    )
    tree = WeightedTree.fromFile(dirPath + treefile)
    return compare(tree.isTree(), expected, outof)


def testIsSpanningtree(treefile, graphfile, expected, outof):
    """
    Reads a tree and a graph from files and tests whether the tree is a spanning tree of the graph,
    assuming that the vertices are numbered the same way.

    Parameters:
      str treefile, graphfile: names of files containing tree and graph to be tested
      boolean expected: expected result for that test
      int outof: value of correct answer towards score

    Returns outof if test passed, 0 otherwise
    """
    print(
        "-------  Test whether "
        + treefile
        + " is a spanning tree of "
        + graphfile
        + " for "
        + str(outof)
        + " points -------"
    )
    tree = WeightedTree.fromFile(dirPath + treefile)
    graph = WeightedGraph.fromFile(dirPath + graphfile)
    return compare(tree.isSpanningtree(graph), expected, outof)


def compare(actual, expected, outof):
    """
    Compares actual result vs expected result

    Parameters:
      boolean actual: actual result obtained when running test
      boolean expected: expected result for that test
      int outof: value of correct answer towards score

    Returns outof if test passed, 0 otherwise
    """
    if actual == expected:
        print("         Test yielded correct answer of " + str(expected))
        return outof
    else:
        print("         Test yielded incorrect answer of " + str(actual))
        return 0


# calls main program
if __name__ == "__main__":
    main()
