def fibs n
  return 0 if n == 0
  a = 0
  b = 1
  n.times do
    a, b = b, (a+b)
  end
  a
end

#p fibs(10)

def fibs_rec n
  return 0 if n == 0
  return 1 if n == 1

  return fibs_rec(n - 1) + fibs_rec(n - 2)
end

p fibs_rec 10
