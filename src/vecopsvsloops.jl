# create and assign arrays
# values of m and n defined in Table 1
m = Int(1e1)
n = Int(1e1)

A01 = Array{Float64}(m,n) # m by n 2D array of Float64 numbers
A02 = Array{Float64}(m,n)
A03 = zeros(m,n)
iters = 2

for i = 1:m
  for j = 1:n
    A01[i,j] = 1.0*i
    A02[i,j] = -1.0*i
  end
end

function f1!(A01, A02, A03, m, n, iters)
  # using for i−j loop
  for count in 1:iters
    for i = 1:m
      for j = 1:n
        A03[i ,j] = A01[i ,j] + A02[i ,j]
      end
    end
  end
end

function f2!(A01, A02, A03, m, n, iters)
# using for j−i loop , should be used
  for count in 1:iters
    for j = 1:1:n
      for i = 1:1:m
        A03[i ,j] = A01[i ,j] + A02[i ,j]
      end
    end
  end
end

function f3!(A01, A02, A03, m, n, iters)
  # using vectorization
  for count in 1:iters
    A03 = A01 + A02
  end
end

@time f1!(A01, A02, A03, m, n, iters)
println()
@time f2!(A01, A02, A03, m, n, iters)
println()
@time f3!(A01, A02, A03, m, n, iters)
println()                                                                                           