require 'string_utils.rb'

describe StringUtils, '#reorder' do
  let(:text) { 'helloworld' }

  subject { StringUtils.reorder(text, pref) }

  context 'when the text does not contain preferred characters' do
    let(:pref) { 'abc' }

    it 'returns the original text' do
      subject.should == text
    end
  end

  context 'when the text contains some preferred characters' do
    let(:pref) { 'lwd' }

    it 'correctly orders the text' do
      subject.should == 'lllwdheoor'
    end
  end

  context 'when the text contains all preferred characters' do
    let(:pref) { 'dlroweh' }

    it 'correctly orders the text' do
      subject.should == 'dlllrooweh'
    end
  end
end
