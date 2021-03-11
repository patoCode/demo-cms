var funcionarioControllers = angular.module('funcionarioControllers', []);
funcionarioControllers.controller('FuncionarioListController',['$scope','$http',
	function ($scope,$http) {
			var url = SERVER+"Funcionario/getAllJSON";
			$http.get(url).success(function(data){
			$scope.funcionarios = data;
		});
		$scope.orderProp = 'nombres';
	}
]);