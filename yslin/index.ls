main = ($scope, $timeout) ->
  $scope.video = document.getElementById("liu-201")
  $scope.video-playing = false
  /*
  $timeout ->
    video.play!
    console.log video
  , 2000
  */
  $scope.render = ->
    s = skrollr.get!getScrollTop!
    wh = $(window)height!
    top = $($scope.video).position!top
    h = $($scope.video)height!
    if s + wh > top and s < top + h and $scope.video.paused => $scope.video.play!
    if s > top + h and !$scope.video.paused => $scope.video.pause!
  skrollr.init({forceHeight: false, render: $scope.render})
