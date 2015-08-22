#= require templates/books/index
#= require templates/books/form
#= require templates/books/fakebooks
#= require controllers/books-controller

app = angular.module 'angular-rails-example', ['ngRoute', 'booksController', 'templates']

app.config ['$routeProvider', '$locationProvider', '$httpProvider',
  ($routeProvider, $locationProvider, $httpProvider) ->
    $routeProvider
      .when '/',
        templateUrl: 'books/index.html'
        controller : 'BooksController'

      .when '/fake',
        templateUrl: 'books/fakebooks.html'
        controller : 'FakeController'
      
      .when '/:id',
        templateUrl: 'books/form.html'
        controller : 'BookController'
      
      .otherwise
        redirectTo: '/'

    $locationProvider.html5Mode true
    $httpProvider.defaults.headers.common['X-CSRF-Token'] = $('meta[name=csrf-token]').attr('content')
]
