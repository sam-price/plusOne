module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    sentence = I18n.t('errors.messages.not_saved',
      count: resource.errors.count,
      resource: resource.class.model_name.human.downcase)


    html = <<-HTML
    <br>
    <div class="alert alert-danger">
    <div class="container-fluid">
  	  <div class="alert-icon">
  	    <i class="material-icons">error_outline</i>
  	  </div>
  	  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
  		<span aria-hidden="true"><i class="material-icons">clear</i></span>
    </button>
        #{messages}
      </div>
    </div>
    HTML

    html.html_safe
  end
end
