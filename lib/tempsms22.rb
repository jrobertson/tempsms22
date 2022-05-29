#!/usr/bin/env ruby

# file: tempsms22.rb

# description: Scrapes the temporary SMS number from receive-smss.com.

require 'nokorexi'
require 'ostruct'


class TempSMS22

  attr_accessor :number

  def initialize()

    @url = 'https://receive-smss.com/'

    doc = Nokorexi.new(@url).to_doc

    @a = doc.root.xpath('//a[@class="number-boxes1-item-button"]').map  do |x|
      x.attributes[:href][/\d+/]
    end

    get_smsnum()
  end

  def number()
    @number = @a.sample
  end

  def numbers()
    @a
  end

  def read(number=@number)

    url = @url + 'sms/' + number + '/'
    doc = Nokorexi.new(url).to_doc
    table = doc.root.element('//table')

    a = table.xpath('tbody/tr').map do |x|
      x.xpath('td').map {|y| y.plaintext.strip }
    end

    a.map {|x| OpenStruct.new(%i(from text date).zip(x).to_h) }

  end

end
