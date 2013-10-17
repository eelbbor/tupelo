angular.module('com.tupelo',[])

.controller 'AppCtrl',
  class AppCtrl
    @inject=['$scope']
    constructor: (@$scope) ->
    getTitle: ->
      "Tupelo"