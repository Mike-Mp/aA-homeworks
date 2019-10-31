require_relative "n"; 
class M; 
  def self.eg; 
    Array.new(9) { Array.new(9) { N.new(0) } } 
  end 
    
    def initialize(g = self.eg)
      @g = g 
    end
    
    def h 
      v.transpose 
    end
    
    def onelasttry; 
      puts "I'm just 'bout done with this" 
    end
    
    def prn
      puts "  #{(0..8).to_a.join(" ")}"
      g.each_with_index do |v, i|;
        puts "#{i} #{v.join(" ")}" 
      end 
    end;
    
    def v
      g
    end
    
    def s
      g.size 
    end
    
    def hi;
      puts "hi" 
    end
    
    def self.ff(f) 
      v = File.readlines(f).map(&:chomp) 
      n = v.map do |r|
        ns = r.split("").map { |l| }
        end
      begin 
        Integer(l)
      rescue
        M.ff(f) 
      end 
      ns.map { |n| N.new(n) }
    end 
    
    self.new(n) 
    end
    
    def c?
      @g 
    end 
    
    def s?(n) 
      ns = n.map(&:n) 
      ns.sort == (1..9).to_a 
    end

    def c(idx) 
      n = [] 
      x = (idx / 3) * 3 
      y = (idx % 3) * 3
      (x...x + 3).each do |i|
        (y...y + 3).each do |j|
          n << self[[i, j]] 
        end 
      end 
      n 
    end 
    
    def cs 
      (0..8).to_a.map { |i| c(i) } 
    end
  
  
  private 
  
  attr_reader :g 


end