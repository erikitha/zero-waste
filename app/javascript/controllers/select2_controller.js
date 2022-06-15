import $ from 'jquery';
import 'select2';
import { Controller } from "stimulus"

export default class extends Controller {
  connect() {
    $('.select2').select2();
  }
}
