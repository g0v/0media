// Generated by LiveScript 1.2.0
var main;
main = function($scope, $timeout){
  $scope.video = document.getElementById("liu-201");
  $scope.videoPlaying = false;
  /*
  $timeout ->
    video.play!
    console.log video
  , 2000
  */
  $scope.render = function(){
    var s, wh, top, h;
    s = skrollr.get().getScrollTop();
    wh = $(window).height();
    if (!$scope.video) {
      return;
    }
    top = $($scope.video).position().top;
    h = $($scope.video).height();
    if (s + wh > top && s < top + h && $scope.video.paused) {
      $scope.video.play();
    }
    if (s > top + h && !$scope.video.paused) {
      return $scope.video.pause();
    }
  };
  return setTimeout(function(){
    return skrollr.init({
      forceHeight: false,
      render: $scope.render
    });
  }, 1000);
};