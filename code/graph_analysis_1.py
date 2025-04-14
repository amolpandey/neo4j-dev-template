from neo4j import GraphDatabase

# URI examples: "neo4j://localhost", "neo4j+s://xxx.databases.neo4j.io"
URI = "neo4j://localhost"
AUTH = ("neo4j", "dev$&run123")

with GraphDatabase.driver(URI, auth=AUTH) as driver:
    driver.verify_connectivity()
    # read the cypher script to be executed
    c_query = None
    with open('../cypher/sample.cypher', 'r') as file:
        c_query = file.read() #.replace('\n', '')
    
    result = None
    with driver.session(database="neo4j") as session:
        with session.begin_transaction() as tx:

            result = tx.run(f'CALL apoc.cypher.runMany(\"{c_query}\", {{}})')
            tx.commit()
    print('Created the movie sample database !!')

