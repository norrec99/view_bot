import { initPostApplication } from '../utils/fetch_with_token';

const initSearchApplication = () => {
  const searchForm = document.getElementById('search_app_form');
  const searchInput = document.getElementById('search');
  const results = document.querySelector('#results');

  if (searchForm) {
  searchForm.addEventListener('submit', ((event) => {
    event.preventDefault();
    results.innerHTML = "";
    fetch(`https://data.42matters.com/api/v2.0/android/apps/search.json?access_token=463da46782832f2354f97b126278bf93adf7ba4c&q=${searchInput.value}&limit=10`)
    .then(response => response.json())
    .then(data => {
      data.results.forEach((result) => {
        const resultHTML = `
        <li class="btn btn-flat-reverse">
          <a href="#" class="js-application" data-title="${result.title}">
            ${result.title}
          </a>
        </li>
        `;
        results.insertAdjacentHTML('beforeend', resultHTML);
      });
      initPostApplication();
    });
  }))
}
}

export { initSearchApplication }