# Because of testability you can't use sinatra's anonymous shorthand
# helpers (helpers do), which are hard to reference because of the
# anonymous character. The solution is to make a explicit module and
# propagate it to the application.

module AppHelpers
  def backwards(string)
    string.reverse
  end

  def human_date(datetime)
    datetime.strftime('%-d. %B %Y, %H:%M Uhr')
  end
end

Sinatra::Application.helpers AppHelpers
