$.getJSON(window.location.pathname + '/json.json', function(response) {
  makeChartPretty(response);
  console.log("boooooooooom");
});

function makeChartPretty (dataset) {
  var data = [];
  var vals = [];
  // Generates JSON for values and labels
  for (var i = 0; i < dataset.length; i++) {
    vals.push(
      {
        "label" : dataset[i]["school"]["name"],
        "value" : dataset[i]["school"]["fees12"]
      }
    )
  }

  data.push(
    {
      key: "Tuition 2012",
      color: "#d62728",
      values: vals
    }
  );

  nv.addGraph(function() {
  var chart = nv.models.multiBarHorizontalChart()
      .x(function(d) { return d.label })
      .y(function(d) { return d.value })
      .margin({top: 30, right: 20, bottom: 50, left: 175})
      .showValues(true)
      .tooltips(false)
      .showControls(false);

  chart.yAxis
      .tickFormat(d3.format(',.2f'));

  d3.select('#chart svg')
      .datum(data)
    .transition().duration(500)
      .call(chart);

  nv.utils.windowResize(chart.update);

  return chart;
  });
}


