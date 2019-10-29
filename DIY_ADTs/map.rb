class Map
  attr_reader :array
  def initialize(array)
    @array = array
  end

  def set(key,value)
    @array << [key, value] unless @array.include?(key)
  end

  def get(key)
    @array.each do |subArr|
      subArr.each_with_index do |ele,i|
        if ele == key
          p ele + " #{subArr[i+1]}"
        end
      end
    end
  end

  def delete(key)
    @array.each_with_index do |subArr,i|
      if subArr.include?(key)
        @array.delete_at(i)
      end
    end
  end

  def show
    @array
  end

end

arr = [["key1","value1"]]

maptest = Map.new(arr)
maptest.set("key2", "value2")
p maptest.show
maptest.delete("key1")
p maptest.show
maptest.get("key2")