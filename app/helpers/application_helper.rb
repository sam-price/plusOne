module ApplicationHelper

  # Greeting message method
  def greet
    now = Time.now
    today = Date.today.to_time
    morning = today.beginning_of_day
    noon = today.noon
    evening = today.change( hour: 17 )
    night = today.change( hour: 20 )
    tomorrow = today.tomorrow

    if (morning..noon).cover? now
      'Good Morning'
    elsif (noon..evening).cover? now
      'Good Afternoon'
    elsif (evening..night).cover? now
      'Good Evening'
    elsif (night..tomorrow).cover? now
      'Good Evening'
    end
  end

  # Active Link helper - http://stackoverflow.com/questions/17481812/dynamically-add-active-class-to-bootstrap-li-in-rails
  def link_to_active_li(body, url, html_options = {})
    active = "active" if current_page?(url)
      content_tag :li, class: active do
        link_to body, url, html_options
      end
  end

  # Simple Method to provide different page titles https://rubyplus.com/articles/3321-Pretty-Page-Title-in-Rails-5
  def title(page_title)
    content_for(:title) { page_title }
  end

  # Work out age from date of birth http://stackoverflow.com/questions/819263/get-persons-age-in-ruby
  def age(dob)
    now = Time.now.utc.to_date
    now.year - dob.year - ((now.month > dob.month || (now.month == dob.month && now.day >= dob.day)) ? 0 : 1)
  end

end
