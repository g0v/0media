m = [20,20,20,20]
[w,h] = [$(window)width!,$(window)height!]

main = ($scope) ->
  [w,h] := [$(\.content)width!, $(\.content)height!]
  svg = d3.select \.content .append \svg
    ..attr \width w
    ..attr \height h
    ..attr \viewBox "0 0 #w #h"
    ..attr \preserveAspectRatio "xMidYMid"
  svg
    ..append \g
      ..attr \class \rect
    ..append \g
      ..attr \class \text
  (data) <- d3.json \news.json
  treemap = d3.layout.treemap!size [w,h] .sticky true .value -> it.size
  root = {children: data, name: ""}
  #color = d3.scale.ordinal!range colorbrewer.RdYlGn[11]
  color = d3.scale.ordinal!
    .domain <[媒體 藝文 娛樂 科技 生活 地方 環境 經濟 司法 政治 中國 國際 要聞]>
    .range  <[#a50 #620 #5a0 #0a5 #059 #00b #40a #909 #747 #777 #900 #333 #264]>
  for item in data =>
    item.name = item.title
    item.time = new Date item.date .get-time!
    item.parent = root
    item.children = null
    item.depth = 1
    item.color = color item.cat
  data.sort (a,b) -> b.time - a.time
  p-cat = null
  make = (cat) ->
    if p-cat == null =>
      p-cat := cat 
    else 
      p-cat := null
      cat := null
    if cat => data2 = data.filter(-> it.cat == cat) else data2 = data
    if data.length >= 50 => data2 = [data2[i] for i from 0 til 50]
    data2 = data2.filter(->it and (!cat or it.cat == cat))
    console.log data2.length, data.length
    times = [x.time for x in data2]
    [min, max] = [d3.min(times), d3.max(times)]
    sizer1 = d3.scale.linear!domain [min, max] .range [10,1000]
    sizer2 = d3.scale.linear!domain [min, max] .range [0.8,2.5]
    for item in data2 =>
      item.size = parseInt sizer1 item.time
      item.font = parseInt sizer2 item.time
    treemap = d3.layout.treemap!size [w,h] .sticky true .value -> it.size
    console.log data2.length
    nodes = treemap.nodes {children: data2}
    console.log nodes.length

    /*
    svg.select \g.rect .selectAll \rect.node .data nodes
      ..exit!remove!
      ..enter!append \rect
        ..attr \class \node

    svg.select \g.text .selectAll \text.node .data nodes
      ..exit!remove!
      ..enter!append \text
        ..attr \class \node

    svg.select \g.rect .selectAll \rect.node
      ..on \click -> domake it
      ..style \font-size -> "#{it.font}em"
      ..transition!duration 500
        ..attr \x -> "#{it.x}px"
        ..attr \y -> "#{it.y}px"
        ..attr \width -> "#{it.dx}px"
        ..attr \height -> "#{it.dy}px"
        ..attr \fill -> it.color
    d3.select \g.text .selectAll \text.node
      ..attr \x -> "#{it.x}px"
      ..attr \y -> "#{it.y}px"
      ..text -> it.name
      #..style \width -> "#{it.dx}px"
      #..style \height -> "#{it.dy}px"
    */
    d3.select \.content .selectAll \div.node .data nodes
      ..exit!remove!
      ..enter!append \div
        ..attr \class \node
        ..append \div
          .attr \class \ib
    d3.select \.content .selectAll \div.node
      ..on \click -> domake it
      ..style \font-size -> "#{it.font}em"
      ..select \div.ib
        ..style \width -> "#{it.dx}px"
        ..style \height -> "#{it.dy}px"
        ..text -> it.name
      ..transition!duration 500
        ..style \left -> "#{it.x}px"
        ..style \top -> "#{it.y}px"
        ..style \width -> "#{it.dx}px"
        ..style \height -> "#{it.dy}px"
        ..style \background -> it.color
    
    #$scope.$apply -> $scope.nodes = nodes
  domake = ->
    console.log it.cat
    make it.cat
  make!
