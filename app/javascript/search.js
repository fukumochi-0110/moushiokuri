function search (){
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
  e.preventDefault();
  const form = document.getElementById("form");
  const formData = new FormData(form);
  const XHR = new XMLHttpRequest();
  const query = form.q.value; // 検索入力フィールドの値を取得
  XHR.open("GET", "/search?q=" + query, true); // URLにクエリパラメータを追加  
  XHR.responseType = "json";
  XHR.send(formData);
  XHR.onload = () => {
    const wrapperContainer = document.getElementById("wrapper-container")
    let searchResultsHtml = '';

    const MessagesSearches = XHR.response.messages_search;
    MessagesSearches.forEach((message) => {
      const createdAt = new Date(message.created_at); 
      const formattedDate = `${createdAt.getMonth() + 1}/${createdAt.getDate()}`; 
    
      const Moushiokuri = `
      <div class="message-content">
        <div class="moushiokuri">
          <div class="moushiokuri-title">
            <div>${formattedDate} 申し送り</div>
          </div>
          <div class="moushiokuri-text">
            ${ message.text }
          </div>
          <div class="moushiokuri-image">
            ${ message.image ? `<img src="${message.image}" class="message-image">` : '' }
          </div>
          <div class="moushiokuri-under">
            ${ message.name }
          </div>
        </div>
      </div>`;
      searchResultsHtml += Moushiokuri;
    });
    
    const TasksSearches = XHR.response.tasks_search;
    TasksSearches.forEach((task) => {
      const dueDate = new Date(task.due_date);
      const formattedDueDate = `${dueDate.getMonth() + 1}/${dueDate.getDate()} ${dueDate.getHours()}:${dueDate.getMinutes()}`;
    
      const taskHtml = `
      <div class="message-content">
        <div id="non-comp">
          <div class="comp-title">タスク</div>
          <div class="not-comp">
            <div class="task-text">${ task.text }</div>
            <div class="task-under">
              ${ task.name }
              期限：${ formattedDueDate }
              <form action="/path/to/your/endpoint" id="form-${task.id}">
                <input type="checkbox" name="completed" id="check-${task.id}" ${task.completed ? 'checked' : ''}>
              </form>
            </div>
          </div>
        </div>
      </div>`;
      searchResultsHtml += taskHtml;

    });
    wrapperContainer.insertAdjacentHTML("beforeend", searchResultsHtml);
      };
    });
  };
  
  window.addEventListener('load', search);