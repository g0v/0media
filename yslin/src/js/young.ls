angular.module \yslin
  ..controller \young, ($scope, $timeout) ->
    console.log \ok2
    $scope.tab = 1
    $scope.tgltab = -> 
      $scope.tab = it 
    $scope.tomenu = (tab) -> 
      $(document.body)animate {scrollTop: $(".avatar .ib.p1")offset!top - 100}
      $(\#small-avatars)removeClass \active
      $scope.tgltab tab
    $scope.sb = ->
      $(document.body)animate {scrollTop: 2500}

    $scope.navToggle = null
    $scope.saToggle = false
    $scope.saToggle = false
    if /windows phone|android|ipad|iphone|ipod/i.test(navigator.userAgent.toLowerCase!) =>
      $(\#small-avatars)hide!
      return
    $(window).scroll ->
      t = $(window).scrollTop!
      h = $(window).height!
      a = $(\#yng-c-sep2)offset!top

      if t + h * 1.5 <= a and $scope.saToggle => 
        $scope.$apply -> $scope.saToggle = false
        $(\#small-avatars)removeClass \active
      if t + h * 1.5 >= a and !$scope.saToggle => 
        $scope.$apply -> $scope.saToggle = true
        $(\#small-avatars)addClass \active
      if t + h * 0.5 <= a and $scope.saToggle2 => 
        $scope.$apply -> $scope.saToggle2 = false
        $(\#small-avatars)removeClass \hide
      if t + h * 0.5 >= a and !$scope.saToggle2 => 
        $scope.$apply -> $scope.saToggle2 = true
        $(\#small-avatars)addClass \hide
