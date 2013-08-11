app.controller "TasksController", ($scope, $http, $location, $state, $stateParams, Task) ->

  # =========================================================================
  # Initialize
  # =========================================================================

  $scope.tasks = {}
  $scope.task = {}

  # =========================================================================
  # Show
  # =========================================================================

  if $state.current.name == 'tasks'
    Task.query(
      {}
      ,(response) -> 
        $scope.tasks = response
      ,(response) ->
    )

  if $state.current.name == 'show'
    Task.get
      id: $stateParams['id']
      ,(response) ->
        $scope.task = response
      , (response) ->
    
  # =========================================================================
  # Create
  # =========================================================================
 
  $scope.create = ->
    Task.save(
      {}
    , task:
        title: $scope.task.title
        description: $scope.task.description
    , (response) ->
      $location.path "/tasks"
    , (response) ->
    )
 
  # =========================================================================
  # Update
  # =========================================================================
 
  if $state.current.name == 'edit'
    Task.get
      id: $stateParams['id']
    , (response) ->
      $scope.task = response
    , (response) ->

  $scope.update = ->
    Task.update
      id: $stateParams['id']
    , task:
        title: $scope.task.title
        description: $scope.task.description
    , (response) ->
      $location.path "/tasks"
    , (response) ->

 
  # =========================================================================
  # Destroy
  # =========================================================================
 
  $scope.destroy = (id) ->
    Task.delete
      id: id

    , (response) ->
      i = 0
      while i < $scope.tasks.length
        if $scope.tasks[i]['id'] is id
          $scope.tasks.splice(i,1)
        i++
    , (response) ->