#!/usr/bin/env ruby

# file: tempsms22.rb

# description: Scrapes the temporary SMS number from receive-smss.com.

require 'nokorexi'


class TempSMS22

  attr_reader :number

  def initialize()
    @url = 'https://receive-smss.com/'
    get_smsnum()
  end

  def read()

    url = @url + 'sms/' + @number + '/'
    doc = Nokorexi.new(url).to_doc
    table = doc.root.element('//table')

    a = table.xpath('tbody/tr').map do |x|
      x.xpath('td').map {|y| y.plaintext }
    end

    a.map {|x| %i(from text date).zip(x).to_h }

  end

  private

  def get_smsnum()

    doc = Nokorexi.new(@url).to_doc

    a = doc.root.xpath('//a[@class="number-boxes1-item-button"]').map  do |x|
      x.attributes[:href]
    end

    @number = a.first[/\d+/]
  end

end
