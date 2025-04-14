// Clear data
MATCH (n) DETACH DELETE n;

// Create constraints
CREATE CONSTRAINT Person_tmdbId IF NOT EXISTS
FOR (p:Person) REQUIRE p.tmdbId IS UNIQUE;

CREATE CONSTRAINT Movie_movieId IF NOT EXISTS
FOR (m:Movie) REQUIRE m.movieId IS UNIQUE;

// Create person nodes
LOAD CSV WITH HEADERS FROM 'file:///sample/persons.csv' AS row
MERGE (p:Person {tmdbId: toInteger(row.person_tmdbId)})
SET p.name = row.name, p.born = date(row.born);

// Create movie nodes
LOAD CSV WITH HEADERS FROM 'file:///sample/movies.csv' AS row
MERGE (m:Movie {id: toInteger(row.movieId)})
SET
    m.title = row.title,
    m.imdbId = toInteger(row.movie_imdbId),
    m.languages = split(row.languages, '|'),
    m.genres = split(row.genres, '|');

// Create relationships
LOAD CSV WITH HEADERS FROM 'file:///sample/acted_in.csv' AS row
MATCH (p:Person {tmdbId: toInteger(row.person_tmdbId)})
MATCH (m:Movie {id: toInteger(row.movieId)})
MERGE (p)-[r:ACTED_IN]->(m)
SET r.role = row.role;

// Set additional node label
MATCH (p:Person)-[:ACTED_IN]->()
WITH DISTINCT p
SET p:Actor;