# Neo4j Developer Template
This is a neo4j development template with the pre-configured sample CSV files mapped to import section for `LOAD CSV`. 

A sample python script to programatically connect to neo4j instance and create a sample graph from the cypher query file. 

This setup comes with the `apoc` & `graph-data-science` plugin configured for the setup.

## Demo electrical distribution graph
This setup includes a sample graph data for the ficticious electrical distribution, that will allow the users to design and evalute the queries on the sample graph DB. 

`call db.schema.visualization`

![Electrical Distribution Graph](img/Screenshot%202025-04-24%20at%202.35.23 pm.png)

The script components of this demo graph are as follows:
- code/graph_analysis_2.py : This script will read the parquet file and generate the CSV format required for ingestion into Ne04J
- src/import/elect_dist : This is the destination location for the CSV which will be  visible to Neo4J database
- data/graph_data.parquet : This is a dummy data electrical distribution graph 
- cypher/elect_dist.cypher : This contains the scripts to load the CSV data as graph and sample analytical queries


## Docker multiple folder on same volume

There has been few insitances where I didnt wanted to create multiple volumes/bind mounts, instead I wanted to have multiple folders within the same volume mapped to various locations of the target container. 

This setup illustrates the same with the help of following refrences:

[Github - Single Volume - Multiple folder mount](https://github.com/moby/moby/issues/47842)

[Docker - Single Volume - Multiple folder mount](https://forums.docker.com/t/volume-subpath-in-docker-compose/143463/5)

![Multiple folder in single volume](img/Docker_Desktop_J0iBjOJf85.png)

The above folders are mapped respectivly in the running container

![Multiple folder in single volume container mapping](img/Docker_Desktop_xfW9o1K4nJ.png)

## Neo4J Configuration and Cypher Refrences

[Getting started with Neo4j in Docker](https://neo4j.com/docs/operations-manual/current/docker/introduction/)

[Cypher Cheat Sheet](https://neo4j.com/docs/cypher-cheat-sheet/5/all/)

[LOAD CSV](https://neo4j.com/docs/cypher-manual/current/clauses/load-csv/)

[Query Neo4J](https://neo4j.com/docs/cypher-manual/current/clauses/)

[Configure the APOC extension - Docker](https://neo4j.com/docs/apoc/current/installation/#docker)

[Configure the GDS extension - Docker](https://neo4j.com/docs/graph-data-science/current/algorithms/)

## Setup Python virtual environment for Neo4J script automation and query

`python -m venv .grph`

`.\.grph\Scripts\activate.ps1`

`pip install -r .\requirements.txt`

`python.exe -m pip install --upgrade pip`

## Custom alias in MacOS 

`open -e ~/.bash_profile`

`open -e ~/.zshrc`