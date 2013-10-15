describe "Core functionality - motion-csv" do
  before do
    @data = <<-CSV
a,b,c,d,e,f,g,h,i,j,k,l,m,
,,1,1.1,-1,-1.1,1.1.1,"1",a,"a","a""a","a
""a",",",

0,1,2,3,4,5,6,7,8,9,10,11,12,14
    CSV
  end

  it "works" do
    table = MotionCSV.parse(@data)
    table.headers.should == [:a,:b,:c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:_]
    table.lines.should == 2

    table[0].should == [nil, nil, "1", "1.1", "-1", "-1.1", "1.1.1", "1", "a", "a", "a\"a", "a\n\"a", ",", nil]
    table[1].should == ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "14"]

    row = table[1]
    row.pull(:a, nil, 'd').should == ["0","14","3"]
    row[:b].should == "1"
    row["b"].should == "1"
  end

  it "allows mutation of rows" do
    each_called = false
    table = MotionCSV.parse(@data).each do |row|
      each_called = true
      row[:foo] = "bar"
      row.headers.should == [:a, :b, :c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:_, :foo]
    end
    each_called.should == true
    table.headers.should == [:a, :b, :c,:d,:e,:f,:g,:h,:i,:j,:k,:l,:m,:_]
  end

  it "should generate a CSV in a block" do
    csv_string = MotionCSV.generate do |csv|
      csv << ["row", "of", "CSV", "data"]
      csv << ["another", "row"]
    end
    csv_string.should == "row,of,CSV,data\nanother,row\n"
  end

  it "should turn an array into CSV" do
    csv_string = ["testing", "arrays"].to_csv
    csv_string.should == "testing,arrays\n"

    multi_string = [['array1', 'stuff'],['array2', 'more stuff']].to_csv
    multi_string.should == "array1,stuff\narray2,more stuff\n"
  end

  it "should parse a CSV string" do
    csv_array  = "header1,header2\nCSV,String".parse_csv
    csv_array.headers.should == [:header1, :header2]
    csv_array.should == [["CSV", "String"]]
  end

end

describe "Converters" do
  describe "NumericConverters" do
    it "works" do

      conv = MotionCSV::NumericConversion.new
      conv << ?1.ord
      conv.convert(true).class.should == String
      conv.convert(true).should == "1"

      conv.convert(false).class.should == Fixnum
      conv.convert(false).should == 1

      conv.clear
      conv << ?-.ord
      conv << ?1.ord
      conv.convert(false).class.should == Fixnum
      conv.convert(false).should == -1

      conv.clear
      conv << ?1.ord
      conv << ?..ord
      conv << ?1.ord
      conv.convert(false).class.should == Float
      conv.convert(false).should == 1.1

      conv.clear
      conv << ?-.ord
      conv << ?1.ord
      conv << ?..ord
      conv << ?1.ord
      conv.convert(false).class.should == Float
      conv.convert(false).should == -1.1

      conv.clear
      conv << ?1.ord
      conv << ?..ord
      conv << ?1.ord
      conv << ?..ord
      conv << ?1.ord
      conv.convert(false).class.should == String
      conv.convert(false).should == "1.1.1"

      conv.clear
      conv << ?a.ord
      conv.convert(false).class.should == String
      conv.convert(false).should == "a"

      conv.clear
      conv.should.be.empty
      conv.convert(false).should == nil
      conv.convert(true).should == ""

    end
  end
  describe "NoConverter" do
    it "works" do

      conv = MotionCSV::NoConversion.new
      conv << ?1.ord
      conv.convert(true).class.should == String
      conv.convert(false).class.should == String

      conv.convert(true).should == "1"
      conv.convert(false).should == "1"

      conv.clear
      conv.should.be.empty
      conv.convert(false).should == nil
      conv.convert(true).should == ""

    end
  end
end
