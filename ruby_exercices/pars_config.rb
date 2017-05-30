# MM
class String
   def is_i?
       /\A[-+]?\d+\z/ === self
   end
   def is_f?
     # The double negation turns this into an actual boolean true - if you're 
     # okay with "truthy" values (like 0.0), you can remove it.
     !!Float(self) rescue false
   end 
end

class ParsConfig

  TRUE_VALUES  = ['true',  'on', 'yes']
  FALSE_VALUES = ['false', 'off', 'no']

  def initialize
    @final_hash = Hash.new
  end

  def load_file
    File.readlines('./config.txt').each do |line|
      line.chomp!
      next if line.empty? || line.strip[0] == '#'
      to_hash(line)
    end
    @final_hash
  end

  private

  def to_hash(line)
    line = line.match(/^.*\#/).to_s[0...-1]  if line.include?("#")
    new_array = line.split("=")
    second_value = set_type(new_array[1].strip)
    @final_hash[new_array.first.strip] = second_value
  end

  def set_type(element)
    element = element.downcase
    if TRUE_VALUES.include?(element)
      return true
    elsif FALSE_VALUES.include?(element)
      return false
    end
    return element.to_i if element.is_i?
    return element.to_f if element.is_f?
    element
  end

end  # class ends


pc = ParsConfig.new.load_file

p pc

