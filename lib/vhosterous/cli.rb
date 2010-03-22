module Vhosterous
  class CLI < Thor
    include Thor::Actions
    VALID_DOMAIN = /(([\w-]+\.)?)+[\w-]+\.[\w-]+/ 

    add_runtime_options!
   
    desc "add", "hi how are you"
    method_option :rails,         :type => :boolean, :aliases => ['-r']
    method_option :capistrano,    :type => :boolean, :aliases => ['-c', '--cap']
    method_option :dns,           :type => :boolean, :aliases => ['-d']
    method_option :"google-apps", :type => :boolean, :aliases => ['-g','--google']
    method_option :location,      :type => :string
    def add(domain_name)
      
      # move this to the domain model
      # unless domain_name.match VALID_DOMAIN
      #  say_status :error, " Domain: '#{domain_name}' is not a valid", :red
      #  exit 1
      # end

      # say_status :success, " Domain: '#{domain_name}' is a valid!", :green
      report Domain.create(domain_name,options)
    end

    desc "rm", "remote domain"
    def rm(domain_name)
      #domain = Domain.delete(domain_name)
      report Domain.delete(domain_name,options)
    end

    desc "list", "list all domains"
    def list(search="")
    end

    private

    def report(domain)
      if domain.errors.any? 
        fatal = false

        domain.domain.errors.each do |error|
          say_status :error, error.message, :red
          fatal ||= error.fatal?
        end

        exit(1) if fatal
      else
        say_status :success, "", :green
      end 
    end
  end
end

