/*angular.module \yslin, <[]>
  ..factory \scollr, -> do
    register: ->
  ..controller \main, ($scope, $interval, $timeout) ->
    console.log \ok-main*/
main = ($scope, $interval, $timeout) ->
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

  refresher = ->
    ta = $(\#tail-anchor).offset!top
    if $scope.totalheight != ta => 
      $scope.totalheight = ta
      $scope.refresh!
  $timeout refresher, 1000
  $interval refresher, 5000
