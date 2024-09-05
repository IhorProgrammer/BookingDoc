const ClientServerInfoData = 
{
    name: "Сервер клієнтів",
    url: "http://____/api/client",
    info: "Виконує задачі по реєстрації, авторизації, підтвердження входу, додавання паспортних даних.",
    methods: 
    [
        {
            id: "GET_1",
            method: "GET",
            connection_name: "ClientServer",
            name: "Авторизація користувачів",
            type: "public",
            info: "Після введення правильного логіну та пароля, система дозволяє користувачу увійти. Підписує користувача на токен, що був виданий до цього",
            form: 
            {
                encryption: true,
                fields: 
                [
                    {name: "login", text: "login", type: "text"},
                    {name: "password", text: "password", type: "password"},   
                ],
                SubmitFunc: ClientServerInfoData__AuthFunc,
            }

        },
        {
            id: "POST_1",
            method: "POST",
            connection_name: "ClientServer",
            name: "Реєстрація користувачів",
            type: "public",
            info:  `
                Реєстрація користувача використовує валідацію даних, про які буде невідомо, користувачу який буде реєструватись без підказок, тому завчасно потрібно подбати про те що валідація на стороні Frontend працювала. При успішній операції код (201). 
                real_name - Не більше 32 символів, 1 літера з великою інші з маленької, без пробілів.
                nickname - Не більше 16 символів, 1 і більше латинська літера. 
                email - Звичайна пошта за стандартами написання пройде валідацію example@gmail.com. 
                phone - Потрібно писати номера починаючи з +, а також без пробілів і інших символів. 
                birthday - 07.08.2024 or 07/08/2024. 
                gender -  False(0) - жіноча стать, True(1) - чоловіча стать. 
                citizenship -  назва міста проживання. 
                password -   більше 8 символів, хочаб велика або маленька літера, а також цифри. 
            `,
            form: 
            {
                encryption: true,
                fields: 
                [
                    {name: "avatar", type : "file", text:"Аватар"},
                    {name: "real_name", type: "text", text:"ІПБ"},
                    {name: "nickname", type: "text", text:"Нікнейм (login) "},
                    {name: "email", type: "email", text:"Email"},
                    {name: "phone", type: "tel", text:"Телефон"},
                    {name: "birthday", type: "date", text:"Дата народження"},
                    {name: "gender", type: "text", text:"Ви чоловік?"},
                    {name: "citizenship", type: "text", text:"Місто проживання"},
                    {name: "password", type: "password", text:"Пароль"},

                ],
                SubmitFunc: ClientServerInfoData__RegUser,
            }
        },        
    ]
}

async function  ClientServerInfoData__AuthFunc( connection ) {
    event.preventDefault();

    //отримання  UserAgent
    const userAgent = navigator.userAgent; 
    //отримання даних
    const form = event.target; // Отримуємо форму
    const login = form.elements['login'].value;
    const password = form.elements['password'].value;
    const data = { "data": {"login": login, "password": password}, "user_agent": userAgent}

    // отримання солі
    const salt = localStorage.getItem('dc_server_salt');
    //Отримання токену
    const token = localStorage.getItem('dc_auth_key');
    if( salt == null || token == null ) {
        alert("Користувач не отримав унікальні токени")
        return;
    }
    
    //шифрування даних
    const { encrypted, iv } = await AES.encrypt(JSON.stringify(data), salt);
    // Формуємо URL з зашифрованими даними
    const url = `${connection}/${encodeURIComponent(encrypted)}/${encodeURIComponent(iv)}`;
    //Запит
    try {
        const response = await fetch(url, {
            method: 'GET',
            headers: {
                'Authorization': `Bearer ${token}`,
                'Content-Type': 'application/json'
            }
        });
        const res = await response.json();
        if(res.meta.code === 200) {
            localStorage.setItem("user_data", JSON.stringify(res.data));
        }

        return res;
    } catch(error) {
        return error;
    }
}


async function ClientServerInfoData__RegUser( connection ) {
    //отримання  UserAgent
    const userAgent = navigator.userAgent; 
    // Отримуємо форму
    const form = event.target; 
    //_________________ВАЛІДАЦІЯ ДАНИХ______________________
    
    const formData = new FormData(event.target);
    formData.set("gender", form.elements['gender'].value = "M"? true : false )


    //Отримання токену
    const token = localStorage.getItem('dc_auth_key');
    if( token == null ) {
        alert("Користувач не отримав унікальні токени")
        return;
    }
    // Формуємо URL з зашифрованими даними
    const url = `${connection}/${encodeURIComponent(userAgent)}`;
    //Запит
    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
                'Authorization': `Bearer ${token}`,
            },
            body: formData
        });
        const res = await response.json();
        if(res.meta.code === 200) {
            localStorage.setItem("user_data", JSON.stringify(res.data));
            
            //Одразу йде авторизація користувача, якщо операція успішна
            //AuthFunc(connection);
        }

        return res;
    } catch(error) {
        return error;
    }




}


async function AuthFacebook( connection ) {
    FB.login() 
}