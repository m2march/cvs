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
    @@sub_expr = /[\w ]* : [\w*]/

    name_buf = ""
    l = io.readline
    while not /-+/ =~ l
      name_buf += l
      l = io.readline
    end
    @name = name_buf.rstrip.lstrip
    sub_buf = []
    
    l = io.readline
    while not io.eof? and @@sub_expr =~ l
      sub_buf << l.split(":").collect { |x| x.lstrip.rstrip } 
      l = io.readline
    end
    @subjects = sub_buf.collect { |x| Subject.new(x) }
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

def gpa(groups)
  s = groups.flat_map { |g| g.subjects.select { |s| /\d+/ =~ s.score }.collect { |s| s.score.to_f } }
  return s.inject(0.0) { |r,x| r += x } / s.size
end

tf = open("transcript.txt", "r")

tg1 = TranscriptGroup.new(tf)
tg2 = TranscriptGroup.new(tf)

puts tg1.to_s
puts tg2.to_s
puts "\
\\vspace{-14pt}\n\
\\cvitemwithcomment{}{}{Grade scale: 10}\n\
\n\
\\vspace{10pt}\n\
\n\
\\cvitemwithcomment{}{GPA}{#{gpa([tg1,tg2]).round(2)}}\n\
\\cvitemwithcomment{}{Expected graduation date}{August 2014}\n\
"
