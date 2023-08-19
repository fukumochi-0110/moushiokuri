function search() {
  const submit = document.getElementById("submit");
  submit.addEventListener("click", (e) => {
    e.preventDefault();
    const form = document.getElementById("form");
    const formData = new FormData(form);
    const XHR = new XMLHttpRequest();
    const query = form.q.value;

    if (query.trim() === "") {
      const searchResultTable = document.getElementById('searchResultTable');
      searchResultTable.innerHTML = "一致する結果がありません";
      return;
    }

    XHR.open("GET", "/search?q=" + query, true);
    XHR.responseType = "json";
    XHR.send(formData);
    XHR.onload = () => {
      const wrapperContainer = document.getElementById("wrapper-container");
      let searchResultsHtml = '';
      const searchResultTable = document.getElementById('searchResultTable');
      const searchResultOverlay = document.getElementById('searchResultOverlay');

      window.addEventListener('click', (e) => {
        const searchResultOverlay = document.getElementById('searchResultOverlay');
        if (e.target !== searchResultOverlay) {
          searchResultOverlay.style.display = 'none';
        }
      });

      if (searchResultOverlay) {
        searchResultOverlay.style.display = 'block';
      }

    const MessagesSearches = XHR.response.messages_search;

    if (MessagesSearches.length === 0) {
      searchResultTable.innerHTML = "一致する結果がありません";
      return;
    }

    MessagesSearches.forEach((message) => {
      const createdAt = new Date(message.created_at);
      const formattedDate = `${createdAt.getFullYear()}年  ${createdAt.getMonth() + 1}月${createdAt.getDate()}日`;

      searchResultsHtml += `
        <div class="message-content">
          <div class="moushiokuri">
            <div class="moushiokuri-title">
              <div>${formattedDate} 申し送り</div>
            </div>
            <div class="moushiokuri-text">
              ${message.text}
            </div>
            <div class="moushiokuri-image">
              ${message.image ? `<img src="${message.image}" class="message-image">` : ''}
            </div>
            <div class="moushiokuri-under">
              ${message.name}
            </div>
          </div>
        </div>`;
      });

      searchResultTable.innerHTML = searchResultsHtml;
    };
  });
}
window.addEventListener('load', search);