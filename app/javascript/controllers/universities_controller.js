import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="universities"
const tasks = document.querySelector("#tasks")

export default class extends Controller {
  connect() {
    fetch("http://universities.hipolabs.com/search?country=Sweden")
      .then(response => response.json())
      .then((data) => {
        let counter = 0
        data.forEach((result) => {
            counter ++
            const task = `<a href="/task/${counter}" class="list-group-item list-group-item-action d-flex gap-3 py-3" aria-current="true">
              <img src="https://github.com/twbs.png" alt="twbs" width="32" height="32" class="rounded-circle flex-shrink-0">
                <div class="d-flex gap-2 w-100 justify-content-between">
                  <div>
                    <h6 class="mb-0">${result.name}</h6>
                    <p class="mb-0 opacity-75">${result.web_pages[0]}</p>
                  </div>
                  <small class="opacity-50 text-nowrap">${result.alpha_two_code}</small>
                </div>
            </a>`
            tasks.insertAdjacentHTML("beforeend",task)
            // console.log("click",counter)
        })
      })

 }
}
