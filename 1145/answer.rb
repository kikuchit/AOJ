class GenomeDB
  class GenomeData
    def initialize
      @length = 0
      @num = 0
      @data_array = []
    end
 
    attr_accessor :num
 
    def size
      @length
    end
 
    def << data
      @length += data.size * @num
      @data_array << data
      self
    end
 
    def [] i
      return '0' if i >= @length
      index = i
      @num.times do
        @data_array.each do |data|
          if index >= data.size
            index -= data.size
            next
          end
          return data[index]
        end
      end
    end
  end
 
  class << self
    def parse seq
      result = GenomeData.new
      result.num = 1
      data_array = genome_parse(seq, 0).first
      if data_array.instance_of?(Array)
        data_array.each do |data|
          result << data
        end
      else
        result << data_array
      end
      result
    end
 
    private
    def genome_parse seq, start
      i = start
      result = []
 
      word = ''
      while i < seq.size
        case seq[i]
        when /[A-Z]/
          word << seq[i]
          i += 1
        when /[0-9]/
          unless word.size == 0
            result << word
            word = ''
          end
          genome_data,next_index = get_compress_data(seq, i)
          result << genome_data
          i = next_index
        when ")"
          unless word.size == 0
            result << word
            word = ''
          end
          i += 1
          break
        end
      end
      result << word unless word.size == 0
      [result, i]
    end
 
    def get_compress_data seq, start
      num = get_num_token(seq, start)
      data_array,next_index = get_data(seq, start + num.size)
      genome_data = GenomeData.new
      genome_data.num = num.to_i
      if data_array.instance_of?(Array)
        data_array.each do |data|
          genome_data << data
        end
      else
        genome_data << data_array
      end
      [genome_data, next_index]
    end
 
    def get_data seq, start
      i = start
      data_array = []
      case seq[i]
      when "("
        i += 1
        data_array,next_index = genome_parse(seq, i)
        i = next_index
      when /[A-Z]/
        data_array << seq[i]
        i += 1
      end
      [data_array, i]
    end
 
    def get_num_token seq, start
      num = ''
      i = start
      while i < seq.size
        if seq[i] =~ /[A-Z(]/
          break
        end
        num << seq[i]
        i += 1
      end
      num
    end
  end
end
 
def main
  loop do
    seq,index = gets.chomp.split(' ')
    break if seq.eql?('0') and index.eql?('0')
    puts GenomeDB.parse(seq)[index.to_i]
  end
end
 
if $0 == __FILE__
  main
end
