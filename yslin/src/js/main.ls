main = ($scope, $interval) ->
  $scope.skrollr = skrollr.init do
    forceHeight: false
    #render: $scope.render
    smoothScrolling: false
  $scope.totalheight = 0
  $scope.refreshing = false
  $scope.refresh = ->
    if $scope.refreshing => clearTimeout $scope.refreshing
    $scope.refreshing = setTimeout ->
      $scope.$apply -> $scope.refreshing = null
      $scope.skrollr.refresh!
    , 500
  $(window).resize -> $scope.refresh!

  $interval ->
    ta = $(\#tail-anchor).offset!top
    if $scope.totalheight != ta => 
      $scope.totalheight = ta
      $scope.refresh!
  ,1000
