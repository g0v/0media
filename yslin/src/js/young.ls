angular.module \yslin
  ..controller \young, ($scope, $timeout, scrollr) ->
    $scope.scrollr = do
      rl: $('#young-sh .redline')
      pk: $('#young-sh .speaker')
    scrollr.register (->$('#young-sh')offset!top + $(window)height!/4), (->$(window)height!/2),  (it)->
      $scope.scrollr.rl.each (i) ->
        $(@)css marginLeft: if i => "#{it * 20}%" else "#{40 - (it * 20)}%"
    scrollr.register (->$('#young-sh')offset!top + $(window)height!/4), (->$(window)height!/2),  (it)->
      $scope.scrollr.pk.each (i) ->
        $(@)css if i => do
          marginLeft: "#{320 - (it *285)}px" 
          marginTop: "#{200 - it * 123}px"
        else
          marginLeft: "#{-410 + it * 285}px"
          marginTop: "#{200 - it * 123}px"

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
    /*
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
    */
