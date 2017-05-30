class Integer
  def factors() (1..self).select { |n| (self % n).zero? } end
end

def get_factors(array)
  factx = []
  array.each do |n|
    factors = n.factors
    factors.delete_if do |f|
      !array.include?(f) || f == n
    end
    factx << factors
  end
  factx
end


array = [10, 5, 2, 20]

factors= get_factors(array)

p factors

