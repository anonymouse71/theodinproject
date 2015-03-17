# Chapter on Numbers. Program challenges
# https://pine.fm/LearnToProgram/chap_01.html

# Write a  program which tells you how many hours are in a year

def how_many_hours_in_n_years years
  days = years * 365
  hours = days * 24
end

p how_many_hours_in_n_years 1

# Write a program which tells you how many minutes are in a decade

def min_in_a_decade
  decade = 10
  days = 365 * decade
  hours = days * 24
  min = hours * 60
end

p min_in_a_decade

# Write a program which tells you how many seconds old are you 

def age_in_seconds age
  days = 365 * age
  hours = days * 24
  min = hours * 60
  sec = min * 60
end

p age_in_seconds 24

# If I am 1204 million seconds old, how old am I?

def find_age seconds
  min = seconds / 60
  hours = min / 60
  days = hours / 24
  years = days / 365
end

p find_age 1204_000_000
