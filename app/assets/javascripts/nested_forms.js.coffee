jQuery ->
  $(document).ready ->
    if $('.duplicatable_nested_form').length > 0
      nestedForm = $('.duplicatable_nested_form').last().clone()

    $(document).on "click", "a.destroy_duplicate_nested_form", (e) ->
      nestedForm = $(this).closest('.duplicatable_nested_form')
      nestedForm.slideUp "normal", ->
        nestedForm.remove()

    $(document).on "click", ".duplicate_nested_form", (e) ->
      e.preventDefault()

      lastNestedForm = $('.duplicatable_nested_form').last()
      newNestedForm = $(nestedForm).clone()
      formsOnPage = $('.duplicatable_nested_form').length

      $(newNestedForm).find('label').each -> 
        oldLabel = $(this).attr 'for'
        newLabel = oldLabel.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
        $(this).attr 'for', newLabel

      $(newNestedForm).find('select, input').each -> 
        oldId = $(this).attr 'id'
        newId = oldId.replace(new RegExp(/_[0-9]+_/), "_#{formsOnPage}_")
        $(this).attr 'id', newId

        oldName = $(this).attr 'name'
        newName = oldName.replace(new RegExp(/\[[0-9]+\]/), "[#{formsOnPage}]")
        $(this).attr 'name', newName

      $(newNestedForm).insertAfter(lastNestedForm)


