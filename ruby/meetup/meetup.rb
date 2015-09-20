require 'date'

class Meetup
  Detail = [:first, :second, :third, :fourth, :last]

  def initialize(month, year)
    @month, @year = month, year
  end

  def day(weekday, schedule)
    meetup = Date.new(@year, @month, 1)
    schedule == :teenth ?
      deal_with_teenth(weekday, meetup) : deal_with_detail(meetup, weekday, schedule)
  end

  def select_day(weekday, start_day)
    end_day = start_day + 6
    [*start_day..end_day].select do |day|
      method_name = (weekday.to_s + '?').to_sym
      day.send(method_name)
    end.first
  end

  def deal_with_teenth(weekday, meetup)
    start_day = meetup + 12
    select_day(weekday, start_day)
  end

  def deal_with_detail(meetup, weekday, schedule)
    factor = Detail.index(schedule)
    start_day = meetup + factor * 7

    rst = select_day(weekday, start_day)
    rst.month != meetup.month ? rst - 7 : rst
  end
end
