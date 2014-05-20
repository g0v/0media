main = ($scope) ->
  h = $(window)height!
  dates = <[1954.04.17 1980.02.28 1981.07.03 2014.02.03 2014.05.14]>
  svg = d3.select \#timeline
  svg.selectAll \g.point .data dates
    ..enter!append \g .attr \class, \point
      ..each (d,i) ->
        it = d3.select @
        it.attr "data-#{(i - 2) * h}", "opacity: 0;@transform:translate(0,550)"
        it.attr "data-#{(i - 1) * h}", "opacity: 1;@transform:translate(0,550)"
        it.attr "data-#{(i + 0) * h}", "opacity: 1;@transform:translate(0,300)"
        it.attr "data-#{(i + 1) * h}", "opacity: 1;@transform:translate(0,50)"
        it.attr "data-#{(i + 2) * h}", "opacity: 0;@transform:translate(0,50)"

      ..append \circle 
        .attr do
          cx: \50
          cy: 0
          r: \7
        
      ..append \text .text(-> it) .attr do
        x: 65
        y: 5

  skrollr.init({forceHeight: false})
