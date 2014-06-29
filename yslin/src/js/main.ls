main = ($scope) ->
  setTimeout ->
    skrollr.init do
      forceHeight: false
      #render: $scope.render
      smoothScrolling: false
  , 1000
