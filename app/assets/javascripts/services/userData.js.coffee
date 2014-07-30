angular.module("User").factory("userkData", ['$http', ($http) ->
  userData =
    data:
     users: [
        {
          name:"Please wait while the page loads",
          location: "",
          email: "",
          image: "",
          course:"",
          phone:"",
        }
      ]
    isLoaded: false

  userData.loadUsers = (deferred) ->
    if userData.isLoaded == false
      $http.get("/users.json").success( (data) ->
        userData.data.users = data
        userData.isLoaded = true
        console.log "Success"
        if deferred
          deferred.resolve()
      ).error( ->
        console.log "Fail"
        if deferred
          deferred.reject "We could not load users"
      )
    else
      if deferred
        deferred.resolve()


  return userData
])

