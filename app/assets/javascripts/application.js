//= require jquery
//= require rails-ujs
//= require activestorage
//= require turbolinks

$(function () {
   $('select#course').on('click', function() {
      $.ajax({
          url: '/filter_student_groups_by_course',
          type: 'GET',
          data: { selected_course: $('select#course').val() }
      });
   });
});
