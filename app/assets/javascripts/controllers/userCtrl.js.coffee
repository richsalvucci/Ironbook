@UserCtrl = ($scope, $location, $routeParams, userData, $q) ->
  console.log "hi"
  $scope.data = 
    userData: userData.data
    currentUser:
      name:"Please wait while the page loads",
      location: "",
      email: "",
      image: "",
      course:"",
      phone:"",
    
  $scope.data.userId = $routeParams.userId
  $scope.title= "User Name"

  $scope.returnHome = ->
    console.log 'returning home'
    $location.url("/")

  $scope.findUserById = ->
    console.log "Hey"
    user = _.findWhere(userData.data.users, {id: parseInt($scope.data.userId)})
    console.log user
    $scope.data.currentUser.name = user.name
    $scope.data.currentUser.location = user.location
    $scope.data.currentUser.email = user.email
    $scope.data.currentUser.image = user.image
    $scope.data.currentUser.course = user.course
    $scope.data.currentUser.phone = user.phone

  $scope.editUser = ->
    console.log "work dangit"
    $location.url("/users/#{$scope.data.userId}/edit")

  $scope.deleteUser = ->
    console.log "delete"
    userData.deleteUser($scope.data.userId)
    $location.url("/")

  @deferred = $q.defer()
  @deferred.promise.then($scope.findUserById)
  userData.loadUsers(@deferred)