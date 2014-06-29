navbar = ($scope) ->
  $scope.showicon = 0
  $scope.iconToggle = (v) ->
    $scope.showicon = v

  $(window).scroll ->
    t = $(window).scrollTop!
    nav = [[\#chapter-young 1] [\#chapter-life 2] [\#chapter-cmp 3] [\#chapter-white 4]]filter ->
      x = $(it.0)offset!top
      y = $(it.0)height!
      if (t >= x) and (t <= x + y) => true else false
    if nav.length => if $scope.navToggle != nav.0.1 => $scope.$apply -> $scope.navToggle = nav.0.1


