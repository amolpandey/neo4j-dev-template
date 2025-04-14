# Neo4j Developer Template
This is a neo4j development template with the pre-configured sample CSV files mapped to import section, sample python script to programatically connect to neo4j instance and create a sample graph from the cypher query file. This setup comes with the `apoc` plugin configured for the setup.

## Refrences

[Getting started with Neo4j in Docker](https://neo4j.com/docs/operations-manual/current/docker/introduction/)

[Cypher Cheat Sheet](https://neo4j.com/docs/cypher-cheat-sheet/5/all/)

[LOAD CSV](https://neo4j.com/docs/cypher-manual/current/clauses/load-csv/)
[Query Neo4J](https://neo4j.com/docs/cypher-manual/current/clauses/)

[Github - Single Volume - Multiple folder mount](https://github.com/moby/moby/issues/47842)
[Docker - Single Volume - Multiple folder mount](https://forums.docker.com/t/volume-subpath-in-docker-compose/143463/5)

### Setup Python virtual environment

`python -m venv .grph`

`.\.grph\Scripts\activate.ps1`

`pip install -r .\requirements.txt`

`python.exe -m pip install --upgrade pip`