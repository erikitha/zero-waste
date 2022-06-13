import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["form", "input", "list"]

  // connect() {
  //   console.log(this.formTarget)
  //   console.log(this.inputTarget)
  //   console.log(this.listTarget)


  // }

  update(event) {
    console.log("TODO: send request in AJAX")
    const url = `${this.formTarget.action}?query=${this.inputTarget.value}`

    fetch(url, { headers: { 'Accept': 'text/plain' } })
      .then(response => response.text())
      .then((data) => {
        // esse data contem de tudo, css html... isso não é um partial
        // então precisamos ir no nosso rails controller...
        // console.log(data);
        // console.log(this.listTarget.outerHTML);
        // pegamos essa lista e substituimos com a resposta do servidor
        this.listTarget.outerHTML = data;
      })
  }
}
