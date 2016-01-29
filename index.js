// Generated by CoffeeScript 1.10.0
(function() {
  'use strict';
  angular.module('widgets').directive('fillgauge', function() {
    var controller, directive, link, template;
    template = '<div ng-class="\'{{cfg.class2}}\'" style="{{cfg.style2}}">\n  {{cfg.descr}}\n</div>\n<div ng-class="\'{{cfg.class3}}\'" style="{{cfg.style3}}">\n  <svg id="fillgauge{{item.id}}" width="100" height="100"\n    ng-init="FillGaugeUpdate(config.id, config.status)">\n  </svg>\n</div>';
    link = function(scope) {
      var widget;
      widget = scope.ngModel;
      return scope.config = scope.ngModel.data();
    };
    controller = function($scope) {
      var widget;
      widget = $scope.ngModel;
      return widget.on('change', function() {
        link($scope);
        return $scope.$apply();
      });
    };
    return directive = {
      restrict: 'E',
      priority: 10,
      scope: {
        ngModel: '='
      },
      template: template,
      controller: controller,
      link: link
    };
  });

}).call(this);
