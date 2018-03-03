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

      @job_title = Array.new
      @job_summary = Array.new
      @company_name = Array.new
      @linkedin_link = Array.new
      @glassdoor_link = Array.new

      i = 0
      # while i < @jobs.length
      @jobs.each do |link|
        @job_title << @jobs[i].text.gsub(/([\n])/,"").strip
        @job_summary << @summary[i].text.gsub(/([\n])/,"").strip
        @company_name << @company[i].text.gsub(/([\n])/,"").strip
        @company_link = @company[i].text.gsub(/([\n])/,"").strip
        @linkedin_company_search = @company_link.gsub(" ", "-")
        @linkedin_url = "https://www.linkedin.com/company/#{@linkedin_company_search}"
        @linkedin_link << @linkedin_url
        @glassdoor_company_search = @company_link.gsub(" ", "-")
        @company_name_length = @company_link.length
        @glassdoor_url = "https://www.glassdoor.com/Reviews/#{@glassdoor_company_search}-reviews-SRCH_KE0,#{@company_name_length}.htm"
        @glassdoor_link << @glassdoor_url
        i += 1
      end
    end
  end
end
