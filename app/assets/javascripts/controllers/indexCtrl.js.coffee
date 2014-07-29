@IndexCtrl = ($scope, $location, $http, userData) ->
  $scope.title = "List of Users"
  $scope.data = userData.data
    
  $scope.viewuser = (userId) ->
    console.log "Is this loading?"
    $location.url("/users/#{userId}")

  $scope.createNewUser = ->
    console.log "Does this load?"
    $location.url("/users/new")

  userData.loadUsers(null)