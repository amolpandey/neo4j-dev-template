// Clear data
MATCH (n) DETACH DELETE n;

// Create electrical nodes
// https://stackoverflow.com/questions/68529849/get-node-label-name-from-csv-file
LOAD CSV WITH HEADERS FROM 'file:///elect_dist/WNA2V04_nodes.csv' AS row
CALL apoc.create.node([row.node_class],{nodeId: row.node_id}) 
YIELD node RETURN count(node);

// Create relationships
// https://neo4j.com/labs/apoc/4.4/misc/match-entities/
LOAD CSV WITH HEADERS FROM 'file:///elect_dist/WNA2V04_node_relation.csv' AS row
MATCH (n1) WHERE n1.nodeId = row.from_node //  (p:Person {tmdbId: toInteger(row.person_tmdbId)})
MATCH (n2) WHERE n2.nodeId = row.to_node // (m:Movie {id: toInteger(row.movieId)})
MERGE (n1)-[r:CONN_TO]->(n2);

// Mark all Leaf Nodes
MATCH (n)
WHERE not (n)-->()
WITH distinct n
SET n:leaf_node;

// Analytical Queries //

// Get all transformer types
MATCH (m:transformer) RETURN m;

//Get all the path starting from the transformer (transformer6522) to all the leaf_nodes
//https://neo4j.com/docs/cypher-manual/current/values-and-types/lists/
//https://stackoverflow.com/questions/37865457/neo4j-shortest-path-for-specific-node-labels-in-between-the-path
//https://neo4j.com/docs/cypher-cheat-sheet/5/all/
//https://neo4j.com/docs/cypher-manual/current/patterns/shortest-paths/#partitions
MATCH p = SHORTEST 1 (m:transformer {nodeId:'transformer6522'})-[:CONN_TO]-+(n:leaf_node)
WHERE ALL(x in nodes(p)[1..] WHERE not (x:transformer))
RETURN  [n in nodes(p) | n.nodeId] AS hops;