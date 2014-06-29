angular.module \yslin
  ..controller \navbar, ($scope) ->
    $scope.showicon = 0
    $scope.iconToggle = (v) ->
      $scope.navToggle = v

    /*$(window).scroll ->
      t = $(window).scrollTop!
      nav = [[\#chapter-white 4] [\#chapter-cmp 3] [\#chapter-life 2] [\#chapter-young 1]]filter ->
        x = $(it.0)offset!top
        if (t >= x - 200) => true else false
      if !nav.length and $scope.navToggle => $scope.$apply -> $scope.navToggle = 0
      else if nav.length and ($scope.navToggle != nav.0.1) => $scope.$apply -> $scope.navToggle = nav.0.1
    */
