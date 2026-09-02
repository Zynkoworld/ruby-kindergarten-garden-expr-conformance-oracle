class Garden
  attr_reader :pots, :students
  def initialize(diagram, students = default_children)
    @pots = parse(diagram)
    @students = students.sort
    assign_pots
  end

  def default_children
    %w(Alice Bob Charlie David Eve Fred Ginny Harriet Ileana Joseph Kincaid Larry)
  end

  private

  def parse(diagram)
    diagram.split("\n").map do |row|
      row.split('').map do |sign|
        plants[sign]
      end
    end
  end

  def plants
    {
      'G' => :grass,
      'V' => :violets,
      'R' => :radishes,
      'C' => :clover
    }
  end

  def assign_pots
    students.each_with_index do |student, i|
      instance_eval "def #{student.downcase}; position = #{i}*2; pots[0][position,2] + pots[1][position,2]; end"
    end
  end
end

require 'json'
__exprs = JSON.parse("[\"Garden.new(\\\"RC\\nGG\\\").alice\", \"Garden.new(\\\"VC\\nRC\\\").alice\", \"Garden.new(\\\"VVCG\\nVVRC\\\").bob\", \"Garden.new(\\\"VVCCGG\\nVVCCGG\\\").bob\", \"Garden.new(\\\"VVCCGG\\nVVCCGG\\\").charlie\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").alice\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").bob\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").charlie\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").david\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").eve\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").fred\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").ginny\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").harriet\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").ileana\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").joseph\", \"Garden.new(\\\"VRCGVVRVCGGCCGVRGCVCGCGV\\nVRCCCGCRRGVCGCRVVCVGCGCV\\\").kincaid\"]")
__out = []
__exprs.each do |e|
  begin
    __out << {ok: true, v: eval(e)}
  rescue => ex
    __out << {ok: false, e: ex.class.to_s}
  end
end
puts JSON.generate({out: __out})
