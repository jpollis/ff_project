class SmartHireController < ApplicationController
  def index

    @user_search = params[:job_search]
    @user_location = params[:location]

    if @user_search.present? && @user_location.present?
      @job_search = @user_search.gsub(/([" "])/, '+')
      @location_search = @user_location.gsub(/([" "])/, '+')
      @response = HTTParty.get("https://www.indeed.com/jobs?q=#{@job_search}&l=#{@location_search}")
    end

    if @response.present?
      @dom = Nokogiri::HTML(@response.body)
      @jobs = @dom.css('.jobtitle')
      @summary = @dom.css('.summary')
      @company = @dom.css('.company')

      @a = Array.new
      @b = Array.new
      @c = Array.new
      @d = Array.new
      @e = Array.new

      i = 0
      # while i < @jobs.length
      @jobs.each do |link|

        @a << @jobs[i].text.gsub(/([\n])/,"").strip

        @b << @summary[i].text.gsub(/([\n])/,"").strip

        @c << @company[i].text.gsub(/([\n])/,"").strip

        @company_link = @company[i].text.gsub(/([\n])/,"").strip
        @linkedin_company_search = @company_link.gsub(" ", "-")
        @linkedin_url = "https://www.linkedin.com/company/#{@linkedin_company_search}"
        @d << @linkedin_url
        @glassdoor_company_search = @company_link.gsub(" ", "-")
        @company_name_length = @company_link.length
        @glassdoor_url = "https://www.glassdoor.com/Reviews/#{@glassdoor_company_search}-reviews-SRCH_KE0,#{@company_name_length}.htm"
        @e << @glassdoor_url
        i += 1
      end
    end
  end
end
