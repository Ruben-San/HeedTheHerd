module TasksHelper

  def today(maildate)
    task.maildate if task.maildate.to_date == Date.today
  end

end
