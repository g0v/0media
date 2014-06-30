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
    range: []
    rlen: 0
    register: (s, e, cb) ->
      @list.push [s, e, cb]
    refresh: ->
      for d,i in @list =>
        [s,o] = [d.0!,d.1!]
        @range[i] = [s, s + o , o]
      @range.sort (a,b) -> b.0 - a.0
      @rlen = @range.length
    tick: (c) ->
      w = $(window).height!
      for item,i in @range =>
        ratio = (( c + w - item.0 ) / item.2) >?0 <?1
        #console.log item.0, item.1, item.2, ratio
        @list[i].2 ratio


  ..controller \main, ($scope, $interval, $timeout, scrollr) ->
   
    $timeout ->
      scrollr.refresh!
      /*$interval ->
        console.log ">>>",$(window).scrollTop!
        scrollr.tick $(window).scrollTop!
      ,1000*/
      #$(window).scroll -> scrollr.tick $(window).scrollTop!
    , 1000
