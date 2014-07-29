# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

User = angular.module("User", ['ngRoute'])


  

  $routeProvider.otherwise({ templateUrl: '../assets/index.html', controller: "IndexCtrl"})
])

User.config(['$httpProvider', (provider) ->
  provider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
])
