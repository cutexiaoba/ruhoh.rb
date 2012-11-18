module Ruhoh::Templaters  
  # The master view for primary template that everything renders into.
  class Master < Ruhoh::Templaters::RMustache
    include Ruhoh::Templaters::PageHelpers
    
    # Delegate #page to the kind of resource this view is modeling.
    def page
      return @page if @page
      parser = context["pointer"]["parser"] rescue nil
      return "" unless parser
      
      @page = parser ? 
        Ruhoh::Resources::Resource.resources[parser].const_get(:View).new(@ruhoh, context) :
        nil
    end

  end
end
