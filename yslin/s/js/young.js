// Generated by LiveScript 1.2.0
var young;
young = function($scope, $timeout){
  console.log('ok2');
  $scope.tab = 1;
  $scope.tgltab = function(it){
    $scope.tab = it;
    return setTimeout(function(){
      return $scope.skrollr.refresh();
    }, 1000);
  };
  $scope.tomenu = function(tab){
    $(document.body).animate({
      scrollTop: $(".avatar .ib.p1").offset().top - 100
    });
    $('#small-avatars').removeClass('active');
    return $scope.tgltab(tab);
  };
  $scope.sb = function(){
    return $(document.body).animate({
      scrollTop: 2500
    });
  };
  $scope.skrollr = skrollr.init({
    forceHeight: false,
    render: $scope.render
  });
  $timeout(function(){
    $scope.skrollr.refresh();
    console.log('ok');
    $('#small-avatars').removeClass('active');
    return console.log($('#small-avatars').attr('class'));
  }, 1000);
  $timeout(function(){
    return console.log($('#small-avatars').attr('class'));
  }, 3000);
  $scope.saToggle = false;
  return $(window).scroll(function(){
    var t, h, a;
    t = $(window).scrollTop();
    h = $(window).height();
    a = $('#yng-c-sep2').offset().top;
    if (t + h * 1.5 <= a && $scope.saToggle) {
      $scope.$apply(function(){
        return $scope.saToggle = false;
      });
      $('#small-avatars').removeClass('active');
    }
    if (t + h * 1.5 >= a && !$scope.saToggle) {
      $scope.$apply(function(){
        return $scope.saToggle = true;
      });
      return $('#small-avatars').addClass('active');
    }
  });
};