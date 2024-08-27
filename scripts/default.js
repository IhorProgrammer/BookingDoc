document.addEventListener("DOMContentLoaded", () => {
    CodeLoader();
})


function copyCode() {
    // Отримуємо текст з елемента <code>
    const codeElement = document.querySelector('.code-container code');
    const codeText = codeElement.innerText;

    // Створюємо тимчасовий елемент <textarea>, копіюємо в нього текст і копіюємо його в буфер обміну
    const textArea = document.createElement('textarea');
    textArea.value = codeText;
    document.body.appendChild(textArea);
    textArea.select();
    document.execCommand('copy');
    document.body.removeChild(textArea);

    // Підтвердження копіювання (опціонально)
    alert('Код скопійовано!');
}


function CodeLoader() {
    const scriptCode = document.querySelectorAll("#script_code");
    const insertDiv = document.querySelectorAll("#insert_code");
    
    scriptCode.forEach( code => {
        const scriptText = code.textContent;
        const functionBody = scriptText.match(/{([\s\S]*)}/)[1];
        insertDiv.forEach( insert => {
            if( code.getAttribute("data-script") === insert.getAttribute("data-script") ) {        
                insert.textContent = functionBody; 
            }     
        })
    });
}
