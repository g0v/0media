young = ($scope, $timeout) ->
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
  $scope.skrollr = skrollr.init({forceHeight: false, render: $scope.render})
  $timeout ->
    $scope.skrollr.refresh!
  , 1000

