##Justification##

For the structural analysis of this network, the Prefuse Force-Directed layout algorithm was applied, with edge distances mathematically weighted by the STRING combined_score attribute. This choice is scientifically justified based on both graph topology physics and biological network modularity.

1.Topological Optimization: The algorithm models the network as a physical system where nodes repel each other and edges act as springs. Weighting by combined_score applies tighter spring tension to highly verified interactions, pulling core complexes together while pushing weakly linked genes to the periphery to eliminate clutter.

2.Biological Accuracy: The combined_score aggregates multiple independent evidence channels (experimental data, co-expression, text mining, and curated databases). Using it ensures that the physical distance between proteins on the screen represents the true sum of modern biological consensus.

3.Clear Modularity: This specific layout successfully untangles the 115 interacting glioblastoma genes into visible, distinct functional neighborhoods—such as the hyper-dense cell-cycle cluster at the bottom—making downstream hub-gene analysis (via cytoHubba) incredibly efficient.

