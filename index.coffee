# ## Widget fillgauge
# @author Alex Suslov <suslov@me.com>
'use strict'
angular.module('widgets')

.directive 'fillgauge',  ->
  # ### template
  # <img style="float:left;padding-top:2px;" src="./img/led/led_{{color}}.png">
  template = '''
<div ng-class="'{{cfg.class2}}'" style="{{cfg.style2}}">
  {{cfg.descr}}
</div>
<div ng-class="'{{cfg.class3}}'" style="{{cfg.style3}}">
  <svg id="fillgauge{{item.id}}" width="100" height="100"
    ng-init="FillGaugeUpdate(config.id, config.status)">
  </svg>
</div>'''
  # console.log 'template', template

  # ### link
  link = (scope) ->
    # widget model
    widget = scope.ngModel
    scope.config = scope.ngModel.data()

  # ### controller
  controller = ($scope) ->
    widget = $scope.ngModel

    widget.on 'change', ->
      link $scope
      $scope.$apply()

  directive =
    restrict: 'E'
    priority: 10
    scope: ngModel: '='
    template: template
    controller: controller
    link: link


