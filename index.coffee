# ## Widget fillgauge
# @author Alex Suslov <suslov@me.com>
'use strict'
angular.module('widgets')

.directive 'fillgauge',  ->
  # ### template
  template = '''
<div ng-class="'{{cfg.class2}}'" style="{{cfg.style2}}">
  {{cfg.descr}}
</div>
<div ng-class="'{{cfg.class3}}'" style="{{cfg.style3}}">
  <burble id='fg-{{cfg.id}}' value='{{percentage}}' ng-model='cfg' ></burble>
</div>'''
  # console.log 'template', template

  # ### link
  link = (scope) ->
    # widget model
    widget = scope.ngModel
    scope.cfg = scope.ngModel.data()
    scope.percentage = scope.cfg.value.status if scope.cfg?.value?.status

  # ### controller
  controller = ($scope) ->
    widget = $scope.ngModel

    widget.on 'change', ->
      link $scope
      $scope.$apply()

  directive =
    restrict: 'E'
    priority: 10
    template: template
    controller: controller
    link: link


