const TokenServerInfoData = 
{
    name: "Сервер токенів",
    url: "http://____/api/token",
    info: "Виконує задачі по отриманню токенів доступу. Надає можливості по створенню токенів, які допомагають відновити пошту, швидкий доступ до акаунту (наприклад, Google авторизація). Також надає можливість перейти за посиланням, щоб підтвердити свою електронну пошту. Час дії токену бескінечний",
    methods: 
    [
        {
            id: "GET_1",
            method: "GET",
            connection_name: "TokenServer",
            name: "Отримання salt токену [/{userAgent}]",
            type: "private",
            info:  `
                Використовується для перевірки на те що токен вже пройшов авторизацію і отримання salt, що використовуэться для шифрування, дешифрування між клієнтом і сервером.
            `,
            form: 
            {
                SubmitFunc: () => "Не має коду, використовується між серверами",
            }
        },
        {
            id: "POST_1",
            method: "POST",
            connection_name: "TokenServer",
            name: "Отимання токену [/]",
            type: "public",
            info:  `
                Використовується для отримання токену, що потім ідентифікує користувача в сисетемі і надає право доступа до тої чи іншої інформації. А також в добавок отримується salt, що використовуэться для шифрування повыдомлень мыж сервером і користувачем.
            `,
            form: 
            {
                SubmitFunc: TokenServerInfoData__GetToken,
            }
        },
        {
            id: "PUT_1",
            method: "PUT",
            connection_name: "TokenServer",
            name: "Підписка користувача [/]",
            type: "private",
            info:  `
                Використовується для підписання користувача до токену, що був створений раніше. Підпис може бути тільки 1 на токен. Тобто для підписання одного й того ж користувача потрібно створити ще токен.
            `,
            form: 
            {
                SubmitFunc: () => "Не має коду, використовується між серверами",
            }
        },
        
        {
            id: "GET_D",
            method: "GET",
            connection_name: "TokenServer",
            name: "Отримання salt токену [/decryption/{data}/{iv}]",
            type: "private",
            info:  `
                Використовується для дешифрування повідомлень між серверами.
            `,
            form: 
            {
                SubmitFunc: () => "Не має коду, використовується між серверами",
            }
        },

        {
            id: "GET_S",
            method: "GET",
            connection_name: "TokenServer",
            name: "Отримання всіх сесій [session/{clientId}]",
            type: "public",
            info:  `
                Використовується для отримання всіх сесій
            `,
            form: 
            {
                SubmitFunc: TokenServerInfoData__GetSession,
            }
        },

        {
            id: "DELETE_S",
            method: "DELETE",
            connection_name: "TokenServer",
            name: "Видалення сессії [/session/{clientId}]",
            type: "public",
            info:  `
                Використовується для видалення сесій.
            `,
            form: 
            {
                SubmitFunc: TokenServerInfoData__DeleteSession,
            }
        },

        {
            id: "GET_G1",
            method: "GET",
            connection_name: "TokenServer",
            name: "Авторизація Google [/google/{userAgent}]",
            type: "public",
            info:  `
                Використовується для авторизації через гугл сервіс
            `,
            form: 
            {
                SubmitFunc: TokenServerInfoData__AuthGoogle,
            }
        },
        {
            id: "GET_G2",
            method: "GET",
            connection_name: "TokenServer",
            name: "Авторизація Google [/google/code]",
            type: "private",
            info:  `
                Використовується для авторизації через гугл сервіс
            `,
            form: 
            {
                SubmitFunc: () => "Не має коду, використовується між серверами"
            }
        },
    ]
}


async function TokenServerInfoData__GetSession( connection ) {
    
}


async function TokenServerInfoData__DeleteSession( connection ) {
    
}

async function TokenServerInfoData__GetToken( connection ) {
    const userAgent = navigator.userAgent; 
    const url = `${connection}`;

    const formData = new FormData();
    formData.append("user_agent", userAgent )

    try {
        const response = await fetch(url, {
            method: 'POST',
            headers: {
            },
            body: formData
        });

        const res = await response.json();
        if(res.meta.code === 201) {
            localStorage.setItem('dc_auth_key', res.data.token);
            localStorage.setItem('dc_server_salt', res.data.salt);
        }
    } catch (error) {
        console.error('Помилка:', error);
    }
}

async function TokenServerInfoData__AuthGoogle( connection ) {
    //Отримання токену
    const token = localStorage.getItem('dc_auth_key');
    if( token == null ) {
        alert("Користувач не отримав унікальні токени")
        return;
    }

    const userAgent = navigator.userAgent; 
    const url = `${connection}/google/${encodeURIComponent(userAgent)}`;
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
            window.location.href = res.data;
        }
    } catch (error) {
        console.error('Помилка:', error);
    }
}
