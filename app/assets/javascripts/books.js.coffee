# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
jQuery ->
  $('.draggable').draggable()

  $(".droppable").droppable drop: (event, ui) ->
    chapter = ui.draggable
    chapter_id = ui.draggable.data("id")
    alert chapter_id
    book_id = $("#book_id").attr("value")
    chapter.removeAttr('style')
    # /books/:book_id/chapters/:id(.:format)
    $.ajax "/books/#{book_id}/chapters/#{chapter_id}",
      type: "PUT"
      data: {chapter: {book_id: "#{book_id}"}}
      dataType: 'json'
      success: (data, textStatus, jqXHR) ->
        console.log "Updated book"
        $(".droppable").append(chapter)
