var api = require('./neo4jApi');

$(function () {
  getGraphData();
});


function getGraphData() {
  api
    .getGraph()
    .then(graph => {
      console.log(graph.nodes);
      console.log(graph.links);
    });
}
