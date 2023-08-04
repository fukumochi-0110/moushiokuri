window.onload = function() {
  function check() {
    const checkboxes = document.querySelectorAll("input[id^='check-']");

    checkboxes.forEach((checkbox) => {
      checkbox.addEventListener("change", () => {
        const taskId = checkbox.id.split("-").pop();
        const form = document.getElementById(`form-${taskId}`);
        const actionUrl = form.getAttribute("action");
        const formData = new FormData(form);
        formData.append('is_ajax', 'true');

        const XHR = new XMLHttpRequest();
        XHR.open('POST', `/tasks/${taskId}`, true);

        XHR.responseType = "json";
        XHR.send(formData);
        XHR.onload = () => {
          const item = XHR.response.task;
          const completedContainer = document.getElementById('comp');
          const notCompletedContainer = document.getElementById('non-comp');
          const taskElement = document.getElementById(`task-${item.id}`);
          taskElement.remove();
          if (item.completed) {
            completedContainer.appendChild(taskElement);
          } else {
            notCompletedContainer.appendChild(taskElement);
          }
        };
      });
    });
  }
  check();
}
