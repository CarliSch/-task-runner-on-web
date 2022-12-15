import { Controller } from "@hotwired/stimulus"
// Connects to data-controller="user-phone-number"
const mobile = document.getElementById(form)

export default class extends Controller {
  // static targets = ["mobile"]

  connect() {
    console.log("connected:-)");
  }
  phone() {
    const preven_loading = (event) => {
      event.preventDefault();
      console.dir("hello",mobile);
    }
  }
}


// form.addEventListener("submit", signUp)
// const form = document.querySelector("#form")
