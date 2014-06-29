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
    register: (t, s, e, cb) ->
      @list.push [t, s, e, cb]
    refresh: ->
      for d,i in @list =>
        console.log d,i
        s = $(d.1)offset!top
        e = if d.1==d.2 => $(d.2)offset!top + $(d.2)height! else if d.2 => $(d.2)offset!top else $(d.1)offset!top + 200
        @range[i] = [s,e, e - s]
      @range.sort (a,b) -> b.0 - a.0
      @rlen = @range.length
    tick: (c) ->
      w = $(window).height!
      for item,i in @range =>
        ratio = parseInt(1000 * ( c + w - item.0 ) / item.2) / 10 >?0 <?100
        console.log ratio
        @list[i].3 ratio


  ..controller \main, ($scope, $interval, $timeout, scrollr) ->
   
    $timeout ->
      scrollr.refresh!
      /*$interval ->
        console.log ">>>",$(window).scrollTop!
        scrollr.tick $(window).scrollTop!
      ,1000*/
      $(window).scroll -> scrollr.tick $(window).scrollTop!
    , 2000
