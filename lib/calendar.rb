require 'date'

def to_bg(ce)
   return ce + 1019
end

def to_ce(bg)
  return bg - 1019
end

class ColignyMonth
  attr_reader :name
  attr_accessor :days
  
  def initialize(name, days)
    @name = name
    @days = days
  end
end

class ColignyYear
  attr_accessor :months
  
  def initialize(year)
    @year = year
    populate_months    
  end
  
  def populate_months
    @working_year = to_ce(@year)
    
    @months = [ColignyMonth.new("Samon", 30), 
               ColignyMonth.new("Duman", 29), 
               ColignyMonth.new("Ríur", 30), 
               ColignyMonth.new("Anáian", 29), 
               ColignyMonth.new("Oghron", 30),
               ColignyMonth.new("Cuth", 30),
               ColignyMonth.new("Giamon", 29),
               ColignyMonth.new("Simison", 30),
               ColignyMonth.new("Elem", 29),
               ColignyMonth.new("Édhrin", 30),
               ColignyMonth.new("Canthl", 29)]
               
    if ((@working_year - 2015) % 5 == 0) || ((@working_year - 2015) % 5 == 4)
      @months.insert(8, ColignyMonth.new("Échu", 30))
    else
      @months.insert(8, ColignyMonth.new("Échu", 29))
    end
    
    if ((@working_year - 2015) % 5 == 0) && ((@working_year - 2015) % 30 != 25)
      @months.unshift(ColignyMonth.new("Intercalary One", 29))
    elsif ((@working_year - 2015) % 5 == 2)
      @months.insert(6, ColignyMonth.new("Intercalary Two", 30))
    end
  end
end

class ColignyDate
  attr_accessor :year, :day, :month, :months
  
  def initialize(year, month, day)
    @year = year
    @day = day
    @months = ColignyYear.new(year).months
    @month = @months.find { |s| s.name == month }
  end
  
  def add_days(add)
    @day += add
    
    while @day > @month.days
      if @months[@months.index(@month) + 1].nil?
        @day = @day - @month.days
        @year += 1
        @months = ColignyYear.new(@year).months
        @month = @months[0]
      else
        @day = @day - @month.days
        @month = @months[@months.index(@month) + 1]
      end
    end
  end
  
  def subtract_days(minus)
    @day -= minus
    
    while @day < 1
      if @month = @months[0]
        @year -= minus
        @months = ColignyYear.new(@year).months
        @month = @months[-1]
        @day = @month.days - (@day + 1)
      else
        @month = @months[@months.index(@month) - 1]
        @day = @month.days - (@day + 1)
      end
    end
  end
end

def to_coligny_date(year, month, day)
  start = Date.new(2015, 4, 26)
  end_date = Date.new(year, month, day)
  difference = (end_date - start).to_i
  
  start_coligny = ColignyDate.new(3034, "Intercalary One", 1)
  start_coligny.add_days(difference)
  return start_coligny
end

def to_gregorian_date(year, month, day)
  day_count = -1
  converted = to_ce(year)
  
  (2015...(converted + 1)).each do |current_year|
    if current_year == converted
      final_year = ColignyYear.new(year)
      this_month = final_year.months.find { |s| s.name == month }
      (0...(final_year.months.index(this_month) + 1)).each do |current_month|
        if current_month == final_year.months.index(this_month)
          day_count += day
        else
          day_count += final_year.months[current_month].days
        end
      end
    else
      ColignyYear.new(to_bg(current_year)).months.each do |current_month|
        day_count += current_month.days
      end
    end
  end
    
  return Date.new(2015, 4, 26) + day_count
end

year = ColignyDate.new(3062, "Ríur", 10)
puts year
puts "#{year.year} #{year.month.name} #{year.day}"
puts to_gregorian_date(3062, "Ríur", 10).inspect

example = ColignyYear.new(2017)
puts example.months.inspect

