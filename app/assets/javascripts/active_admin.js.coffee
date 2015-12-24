#= require active_admin/base
#= require cloudinary

class @Uploader
  @uploaders: []
  @allComplete: ->
    complete = true
    for uploader in @uploaders
      if uploader.uploading
        complete = false
        break
    complete
  constructor: (el) ->
    @el = $(el)
    @status = @el.siblings('.upload-status')
    @preview = @el.siblings(".upload-preview")
    @uploading = false
    @counter = 0
    @interval = null
    @setupListeners()
    Uploader.uploaders.push @
  setupListeners: ->
    @el.on 'fileuploadstart', @handleUploadStart.bind(@)
    @el.on 'fileuploadfail', @handleUploadFail.bind(@)
    @el.on 'cloudinarydone', @handleUploadComplete.bind(@)
  showUploading: ->
    str = ""
    for i in [0..@counter]
      str += "."
    @status.text "uploading#{str}"
    @counter = (@counter + 1) % 3
  showPreview: (result) ->
    if @preview[0].tagName == 'IMG'
      @preview.attr('src', result.result.url)
    else
      @preview.attr('href', result.result.url)
  clearState: ->
    @uploading = false
    clearInterval @interval
    @status.empty()
  handleUploadStart: ->
    @uploading = true
    @interval = setInterval @showUploading.bind(@), 200
  handleUploadFail: ->
    @clearState()
  handleUploadComplete: (e, result) ->
    @showPreview result
    @clearState()

$ ->
  $(".cloudinary-fileupload").each (i, el) ->
    new Uploader(el)
  $("form").on 'submit', (e) ->
    e.preventDefault() unless Uploader.allComplete()
