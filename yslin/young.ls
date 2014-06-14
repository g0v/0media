young = ($scope) ->
  $scope.tab = 1
  $scope.tgltab = -> $scope.tab = it 
  $scope.tocontent = -> $(document.body)animate scrollTop: 3815
  $scope.tomenu = -> $(document.body)animate scrollTop: 2815
  $scope.sb = ->
    $(document.body)animate scrollTop: 2500
  skrollr.init({forceHeight: false, render: $scope.render})

