import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dogs"
export default class extends Controller {
  connect() {
    const results = document.querySelector(".results")
    // console.log("moin", results)
    fetch("https://dog.ceo/api/breeds/image/random")
      .then(response => response.json())
      .then((data) => {
        const dogImage = `<li class="list-inline-item">
        <img src="${data.message}" alt="">
        <p>" Big ${data.status} "</p>
      </li>`
        results.insertAdjacentHTML("beforeend", dogImage)
      })
  }
}
