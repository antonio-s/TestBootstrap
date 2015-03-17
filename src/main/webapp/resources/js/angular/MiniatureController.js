/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function Miniature(title){
    this.title = title;
}

function MiniatureController($scope){
//    $scope.miniatures = [new Miniature("miniature - 1"),new Miniature("miniature - 2")];
    
    $scope.miniatures = [
        new DashBoardWidget({type:Types.TABLE,title:"simple table"}),
        new DashBoardWidget({type:Types.CHART,title:"simple chart"})
    ];

}
