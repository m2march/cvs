# encoding: utf-8

class Subject 
  attr_accessor :name, :score

  def initialize(a)
    self.name = a[0]
    self.score = a[1]
  end

  def to_s
    "\\item \\cvgradeitem{#{self.name}}{#{self.score}}"
  end
  
end


class TranscriptGroup
  attr_accessor :name, :subjects

  def initialize(io)
    name, key_values = read_titled_colon_separated_dictionary(io)
    @name = name

    @subjects = key_values.collect { |x| Subject.new(x) }
  end

  def to_s
    r = "\\cvitem{#{self.name}}{\n"
    r += "\\begin{itemize}\n"
    self.subjects.each { |s| r += s.to_s + "\n" }
    r += "\\end{itemize}\n"
    r += "}\n"
    return r
  end
end

def read_titled_colon_separated_dictionary(io)
    sub_expr = /[\w ]* : [\w*]/

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

puts tg1.to_s
puts tg2.to_s
puts "\
\\vspace{-14pt}\n\
\\cvitemwithcomment{}{}{%{grade_scale}: 10}\n\
\n\
\\vspace{10pt}\n\
\n\
\\cvitemwithcomment{}{%{gpa}}{#{gpa([tg1,tg2]).round(2)}}\n\
\\cvitemwithcomment{}{%{expected_graduation_date_text}}{%{expected_graduation_date}}\n\
" % dict
