import $ from 'jquery';
import 'select2';
import 'select2/dist/css/select2.css'

const initSelect2 = () => {
  $(document).ready(function() {
    $('.beautiful-dropdown').select2();
  });
};

export default { initSelect2 };
