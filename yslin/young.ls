young = ($scope, $timeout) ->
  $scope.tab = 1
  $scope.tgltab = -> 
    $scope.tab = it 
    setTimeout (->$scope.skrollr.refresh!), 1000
  $scope.tomenu = (tab) -> 
    $(document.body)animate {scrollTop: 2700}, 2000
    $scope.tgltab tab
  $scope.sb = ->
    $(document.body)animate {scrollTop: 2500}, 2000
  $scope.skrollr = skrollr.init({forceHeight: false, render: $scope.render})
  $timeout ->
    $scope.skrollr.refresh!
  , 1000

