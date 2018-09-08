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
WITH id(n) AS id, n.title AS title
WITH apoc.map.fromPairs([["id",id],["title",title]]) AS map
RETURN COLLECT(map) AS maps

MATCH (n:Person)
WITH id(n) AS id, n.name AS name
WITH apoc.map.fromPairs([["id",id],["name",name]]) AS map
RETURN COLLECT(map) AS maps
