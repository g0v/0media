angular.module \yslin
  ..controller \white, ($scope, $timeout) ->
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
      if !$scope.video => return
      top = $($scope.video).position!top
      h = $($scope.video)height!
      if s + wh > top and s < top + h and $scope.video.paused => $scope.video.play!
      if s > top + h and !$scope.video.paused => $scope.video.pause!

    melist-range = [[0 120] [120 350] [350 510] [510 695] [695 900] [900 1120] [1120 1400]]map ->
      [it.0/1440, it.1/1440]
    console.log melist-range
    $scope.melistTab = 0
    $scope.melist = (e) ->
      p = e.clientX / $(window)width!
      ret = melist-range.map((d,i) -> if d.0 <= p and d.1 >= p => i else -1)filter -> it >= 0
      $scope.melistTab = if ret.length <= 0 => 0 else ret.0 + 1
