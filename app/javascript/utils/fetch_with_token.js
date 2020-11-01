import { csrfToken } from "@rails/ujs";

const fetchWithToken = (url, options) => {
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers
  };
  options.credentials = "same-origin";
  return fetch(url, options);
}

const postApplication = (name) => {
  fetchWithToken("/applications", {
    method: "POST",
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
    body: JSON.stringify({ application: { name: name }}) 
  })
    .then(response => response.json()) 
    .then((data) => {
      window.location.href = '/applications';
    })
}

const initPostApplication = () => {
  const btns = document.querySelectorAll('.js-application');
  btns.forEach((btn) => {
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      postApplication(btn.dataset.title);
    })
  } )
}

export { initPostApplication }
