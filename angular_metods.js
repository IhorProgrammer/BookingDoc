// Define the AngularJS module
var app = angular.module('myApp', []);

app.component('main', {
  template: `
    <div ng-if="$ctrl.localhostStarted == true">
      <h1>{{ $ctrl.data.name }} ( {{ $ctrl.data.url }} )</h1>
      <p>{{ $ctrl.data.info }}</p>
      <div class="accordion" id="accordionPanelsStayOpenExample">
        <accordion-item
          ng-repeat="item in $ctrl.data.methods track by $index"
          method-data="item"
        >
        </accordion-item>
      </div>
    </div>
    <div ng-if="$ctrl.localhostStarted == false">
      <vsinfo></vsinfo>
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
      this.localhostStarted = true;
    } else if (page === 'token' && !this.scriptLoaded['token']) {
      this.data = TokenServerInfoData;
      this.scriptLoaded['token'] = true;
      this.localhostStarted = true;
    }
    else {
      this.localhostStarted = false;
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

app.component('vsinfo', {
  template: `
    <h1>Інструкція: Встановлення розширення Live Server та запуск файлу Home.html</h1>
    <br>
    <br>
    <div >
        <h2>1. Встановлення розширення Live Server</h2>
        <ol class="neon">
            <li>Відкрийте VS Code.</li>
            <li>Перейдіть до панелі розширень, натиснувши на іконку розширень зліва або скористайтеся комбінацією клавіш <code>Ctrl + Shift + X</code> (на Windows/Linux) або <code>Cmd + Shift + X</code> (на macOS).</li>
            <li>У рядку пошуку введіть <strong>Live Server</strong>.</li>
            <li>Знайдіть розширення <em>Live Server</em> від <strong>Ritwick Dey</strong> і натисніть кнопку <strong>Install</strong>.</li>
            <li>Після встановлення перезапустіть VS Code, якщо буде потрібно.</li>
        </ol>
    </div>
    <br>
    <div >
        <h2>2. Запуск файлу Home.html</h2>
        <ol class="neon">
            <li>Відкрийте файл <code>Home.html</code> у VS Code.</li>
            <li>Клацніть правою кнопкою миші на відкритому файлі і виберіть опцію <strong>Open with Live Server</strong>.</li>
            <li>Або скористайтеся комбінацією клавіш <code>Alt + L</code>, потім <code>Alt + O</code> для швидкого запуску.</li>
            <li>Ваш браузер автоматично відкриє файл за адресою, подібною до <code>http://127.0.0.1:5500/Home.html</code>.</li>
        </ol>
    </div>

    <p>Тепер файл <code>Home.html</code> буде запущений через Live Server, і всі зміни в коді будуть відображені в браузері автоматично при збереженні.</p>
  `,
  controller: function() {

  }
})
