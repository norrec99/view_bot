import { csrfToken } from "@rails/ujs";

const fetchWithToken = (url, options) => {
  options.headers = {
    "X-CSRF-Token": csrfToken(),
    ...options.headers
  };
  options.credentials = "same-origin";
  return fetch(url, options);
}

const postReviews = async (application_id, reviews) => {
  // Iterate over each review
  console.log("about to post reviews")
  let reviewsPromise = new Promise((resolve, reject) => {
    reviews.forEach((review, index, array) => {
      // Create an instance of a review with the information given
      // THIS IS THE PART THAT NEEDS TO BE FILLED OUT
      fetchWithToken("/reviews", {
        method: "POST",
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },

        body: JSON.stringify({ review: {
          reviewer_name: review.author_id,
          rating: review.rating,
          language: review.lang,
          content: review.content,
          reviewed_at: review.date,
          application_id: application_id
        }})
      })
      .then(response => response.json())
      .then((data) => {
        console.log(data);
      })
      if (index === 99) {
        setTimeout(function(){ window.location = `/applications`; }, 2000);
        resolve();
      }  
    })
  });
  const reviewsResult = await reviewsPromise
}

const retrieveReviews = (application_id, package_name) => {

  const test_url = 'https://cors-anywhere.herokuapp.com/https://data.42matters.com/api/v2.0/android/apps/reviews.json?p=com.facebook.katana&access_token=463da46782832f2354f97b126278bf93adf7ba4c&limit=100'
  const real_url = `https://cors-anywhere.herokuapp.com/https://data.42matters.com/api/v2.0/android/apps/reviews.json?p=${package_name}&access_token=463da46782832f2354f97b126278bf93adf7ba4c&limit=100`
  // NEED TO PAY HERE IF YOU WANT TO USE THIS FOR REAL APPS, TO MAKE FUNCTIONAL SWITCH TEST_URL WITH REAL_URL 👇
  fetch(test_url)
  .then(response => response.json())
  .then(data => {
    console.log("posting reviews")
    postReviews(application_id, data.reviews)
  });
}

const postApplication = (name, package_name) => {
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
    console.log("retrieve Reviews")
    retrieveReviews(data["application_id"], package_name)
  })
}

const initPostApplication = () => {
  const btns = document.querySelectorAll('.js-application');
  btns.forEach((btn) => {
    btn.addEventListener('click', (event) => {
      event.preventDefault();
      postApplication(btn.dataset.title, btn.dataset.packageName);
    })
  } )
}

export { initPostApplication }
