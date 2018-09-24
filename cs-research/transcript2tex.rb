# encoding: utf-8

class Subject 
  attr_accessor :name, :score

  def initialize(a)
    self.name = a[0]
    self.score = a[1]
  end

  def to_s
    "#{self.name} & #{self.score} \\\\"
  end
  
end

class SectionlessGroup
    attr_accessor :subjects

    def initialize(subjects)
        @subjects = subjects 
    end
  
    def write_items(r)
        r += "\\hspace{1cm}"
        r += "\\begin{tabular}{p{0.7\\textwidth} p{0.25\\textwidth}}\n"
        self.subjects.each { |s| r += s.to_s + "\n" }
        r += "\\end{tabular}\n"
        r += "\n"
        return r
    end
  
    def to_s
        return write_items("")
    end
end


class TranscriptGroup < SectionlessGroup
  attr_accessor :name, :subjects

  def initialize(io)
    name, key_values = read_titled_colon_separated_dictionary(io)
    @name = name

    @subjects = key_values.collect { |x| Subject.new(x) }
  end

  def to_s
    r = "\\subsection{#{self.name}}\n"
    return write_items(r)
  end

      
end


def read_titled_colon_separated_dictionary(io)
    sub_expr = /[\w ]* (: [\w*])?/

    name_buf = ""
    l = io.readline
    while not /-+/ =~ l
      name_buf += l
      l = io.readline
    end
    name = name_buf.rstrip.lstrip
    key_values = []
    
    l = io.readline
    while not io.eof? and sub_expr =~ l
      key_values << l.split(":").collect { |x| x.lstrip.rstrip } 
      l = io.readline
    end
    return [name, key_values]
end

def gpa(groups)
  s = groups.flat_map { |g| g.subjects.select { |s| /\d+/ =~ s.score }.collect { |s| s.score.to_f } }
  return s.inject(0.0) { |r,x| r += x } / s.size
end

if ARGV.size < 1 
    puts 'Usage: transcript2tex.rb TRANSCRIPT_FILE'
    exit()
end

tf = open(ARGV[0], "r:UTF-8")

tg1 = TranscriptGroup.new(tf)
tg2 = TranscriptGroup.new(tf)
title, key_values = read_titled_colon_separated_dictionary(tf)
dict = Hash[key_values.collect{ |x| [x[0].to_sym, x[1]] }]

tg3 = SectionlessGroup.new([
    Subject.new(["%{gpa_name}" % dict, "%{gpa}" % dict]),
    Subject.new(["%{grade_scale}" % dict, 10])
])

puts "\\begin{minipage}{0.75\\textwidth}"
puts tg1.to_s
puts "\\sectionspace"
puts tg3.to_s
puts "\\sectionspace"
puts tg2.to_s
puts "\\end{minipage}"
