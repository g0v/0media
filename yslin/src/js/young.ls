young = ($scope, $timeout) ->
  console.log \ok2
  $scope.tab = 1
  $scope.tgltab = -> 
    $scope.tab = it 
    setTimeout (->$scope.skrollr.refresh!), 1000
  $scope.tomenu = (tab) -> 
    $(document.body)animate {scrollTop: $(".avatar .ib.p1")offset!top - 100}
    $(\#small-avatars)removeClass \active
    #$(document.body)animate {scrollTop: 2700}
    $scope.tgltab tab
  $scope.sb = ->
    $(document.body)animate {scrollTop: 2500}
  #$scope.skrollr = skrollr.init({forceHeight: false, render: $scope.render})

  /*$timeout ->
    $scope.skrollr.refresh!
  , 1000*/
  $scope.saToggle = false
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

