// Define the AngularJS module
var app = angular.module('myApp', []);

app.component('main', {
  template: `
    <h1>{{ $ctrl.data.name }} ( {{ $ctrl.data.url }} )</h1>
    <p>{{ $ctrl.data.info }}</p>
    <div class="accordion" id="accordionPanelsStayOpenExample">
      <accordion-item
        ng-repeat="item in $ctrl.data.methods track by $index"
        method-data="item"
      >
      </accordion-item>
    </div>
  `,
  controller: function() {
    this.scriptLoaded = {};
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);
    const page = urlParams.get('page');
    const globalUrl = "scripts/methods";

    if (page === 'client' && !this.scriptLoaded['client']) {
      this.data = ClientServerInfoData;
      this.scriptLoaded['client'] = true;
    } else if (page === 'token' && !this.scriptLoaded['token']) {
      this.data = TokenServerInfoData;
      this.scriptLoaded['token'] = true;
    }

  },
  controllerAs: '$ctrl'
});


app.component('accordionItem', {
    templateUrl: 'templates/accordion-item.html',
    bindings: {
      methodData: '=',
    },
    controller: function($timeout) {
      var ctrl = this;
  
      this.$onInit = function() {
        // Функція для обробки форми
        this.submitForm = function() {
            ctrl.response = "";
            if (ctrl.methodData && ctrl.methodData.form && typeof ctrl.methodData.form.SubmitFunc === 'function') {
                ctrl.methodData.form.SubmitFunc( CONNCETION[`${ctrl.methodData.connection_name}`] ).then(res => {
                // Використовуємо $timeout для оновлення інтерфейсу
                $timeout(function() {
                    ctrl.response = JSON.stringify(res, null, 4).trim();
                    console.log('Response:', res);
                });
                }).catch(error => {
                $timeout(function() {
                    ctrl.response = 'Error occurred';
                    console.error('Error:', error);
                });
                });
            }
        };
      };
    }
});
  
