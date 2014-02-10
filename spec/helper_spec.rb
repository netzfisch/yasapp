describe "AppHelpers" do
  subject do
    Class.new { include AppHelpers }
  end

  describe "#backwards" do
    it "reverses given string" do
      expect(subject.new.backwards 'Hello').to eq 'olleH'
    end
  end

  describe "#human" do
    it "formats date and time readable" do
      t = Time.new(2014,02,06,14,18,33)

      expect(subject.new.human_date t).to eq '6. February 2014, 14:18 Uhr'
    end
  end
end
