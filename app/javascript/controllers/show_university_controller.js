import { Controller } from "@hotwired/stimulus"
const click = document.querySelector("#click-me")
// Connects to data-controller="show-university"
export default class extends Controller {
  connect() {
  }
  disable(){
    console.log("click");
  }
}
