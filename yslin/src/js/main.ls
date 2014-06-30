angular.module \yslin, <[]>
  ..directive \lzload -> do
    restrict: \A
    link: (scope, e, attrs, ctrl) ->
      des = $(e.0.parentNode.parentNode.parentNode)
      des.addClass \lz-hide
      if e.prop(\tagName) == \IMG => e.load ->
        des.addClass \lz-show
        scope.isotope.appended des.0
      else scope.isotope.appended e.0.parentNode.parentNode.parentNode
  ..factory \scrollr, -> do
    list: []
    register: (s,e, cb) -> @list.push [s,e,cb]

  ..controller \main, ($scope, $interval, $timeout) ->
    if /windows phone|android|ipad|iphone|ipod/i.test(navigator.userAgent.toLowerCase!) => return
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
