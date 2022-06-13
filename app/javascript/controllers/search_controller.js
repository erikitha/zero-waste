import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content"]

  connect() {
    console.log(this.contentTarget)
  }
}
<div data-controller="search">
  <p class="d-none" search="content">

  </p>
</div>
