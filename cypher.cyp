call apoc.bolt.execute("bolt://localhost:7687",
"MATCH (n:Movie) RETURN n", {})

  {
    "n": {
      "id": 0,
      "entityType": "NODE",
      "properties": {
        "title": "The Matrix",
        "tagline": "Welcome to the Real World",
        "released": 1999
      },
      "labels": [
        "Movie"
      ]
    }
  }

  MATCH (n:Movie)
    WITH DISTINCT labels(n)[0] AS label, id(n) AS id, n.title AS title
    WITH apoc.map.fromPairs([["label",label],["id",id],["title",title]]) AS map
    WITH COLLECT(map) AS movies
    MATCH (n:Person)
    WITH movies, labels(n)[0] AS label, id(n) AS id, n.name AS name
    WITH movies, apoc.map.fromPairs([["label",label],["id",id],["name",name]]) AS map
    WITH movies, COLLECT(map) AS persons
    WITH apoc.coll.union(movies,persons) AS nodes
    MATCH (p:Person)-[r]->(m:Movie)
    WITH DISTINCT nodes, type(r) AS type, id(p) AS source, id(m) AS target
    WITH nodes, apoc.map.fromPairs([["type",type],["source",source],["target",target]]) AS map
    WITH nodes, COLLECT(map) AS links
    RETURN apoc.map.fromPairs([["nodes",nodes],["links",links]]) AS graph_json

// import structure
{
  "nodes": [
    {
      "label": "Movie",
      "title": "The Matrix",
      "id": 0
    },
  ],
  "links": [
    {
      "type": "ACTED_IN",
      "source": 8,
      "target": 0
    },
  ]
}

//big graph query

 WITH
"/Users/mmoo33/Documents/GitHub/neo4j-aframe-vr/public/data/test.json" AS file,
"MATCH (n:Item)-[r:FREQUENTLY_BOUGHT]->(n1:Item)
  WHERE r.score >.70
  WITH labels(n)[0] AS label, id(n) AS id, n.name AS name, n.image_url AS image
  WITH apoc.map.fromPairs([['label',label],['id',id],['name',name],['image',image]]) AS map
  WITH COLLECT(map) AS nodes
  MATCH (n:Item)-[r:FREQUENTLY_BOUGHT]->(n1:Item)
  WHERE r.score >.70
  WITH DISTINCT nodes, type(r) AS type, ROUND(r.score*1000)/1000 AS score, id(n) AS source, id(n1) AS target
  WITH nodes, apoc.map.fromPairs([['type',type],['score','Score: ' + score],['source',source],['target',target]]) AS map
  WITH nodes, COLLECT(map) AS links
 RETURN apoc.convert.toJson({nodes:nodes,links:links}) AS graph_json" AS query
 CALL apoc.export.csv.query(query,file,{format:'plain',batchSize:200})
 RETURN "Done!"
