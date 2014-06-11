young = ($scope) ->
  $scope.tab = 1
  $scope.tgltab = -> $scope.tab = it 
  $scope.sb = ->
    $(document.body)animate scrollTop: 2500
    console.log \ok
  skrollr.init({forceHeight: false, render: $scope.render})
