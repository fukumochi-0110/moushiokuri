function check() {
  const checkboxes = document.querySelectorAll("input[id^='check-']");

  checkboxes.forEach((checkbox) => {
    checkbox.addEventListener("change", () => {
      const taskId = checkbox.id.split("-").pop();
      const form = document.getElementById(`form-${taskId}`);
      const actionUrl = form.getAttribute("action");
      const formData = new FormData(form);

      const XHR = new XMLHttpRequest();
      XHR.open('POST', `/tasks/${taskId}`, true);

      XHR.responseType = "json";
      XHR.onreadystatechange = () => {
        if (XHR.readyState === XMLHttpRequest.DONE && XHR.status === 200) {
          location.reload(); // ページをリロード
        }
      };
  
      XHR.send(formData);
    });
  });
}

window.addEventListener('load', check);
