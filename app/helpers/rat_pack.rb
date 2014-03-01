class RatPack

  class Configure

    def self.set_root(url)
      @root = url
    end

    def self.root
      @root
    end

    def self.enable_auto_views(called_from=nil)
      klass = called_from ? called_from : get_caller(caller)
      klass.class_eval do
        def self.inherited(subclass)
          view_dir = subclass.name.gsub("Controller", "").downcase
          subclass.views = File.expand_path("../../views/#{view_dir}", __FILE__)
          super
        end
      end
    end

    def self.enable_implicit_views
      klass = get_caller(caller)
      enable_auto_views(klass)
      klass.class_eval do
        self.singleton_class.send(:alias_method, :old_inherited, :inherited)
        def self.inherited(subclass)
          old_inherited(subclass)
          after do
            if response.redirect?
              sanitized_path = response.location.gsub(RatPack::Configure.root,"")
              split_path = sanitized_path.split("/").reject{|e| e.empty?}
            else
              split_path = request.path.split("/").reject{|e| e.empty?}
            end
            puts "Body Empty: #{response.body.empty?}"
            puts "Split Path: #{split_path.inspect}"
            puts "View: #{RatPack::Helpers.get_view(split_path)}"
            puts "Controller: #{subclass.name}"
            binding.pry
            if response.body.empty?
              body erb RatPack::Helpers.get_view(split_path)
            end
          end
        end
      end
    end

    private

      def self.get_caller(caller)
        camel_case_name = caller.first.match(/(?<=\/)([^\/]*).rb/)[1]
        formatted_name = camel_case_name.split('_').map(&:capitalize).join
        Kernel.const_get(formatted_name)
      end

  end

  class Helpers

    def self.get_view(split_path)
      # TODO: Support these options
      # random_path => "/anything" => ["anything"]

      if split_path.size == 1 || split_path.empty?
        :index
      elsif split_path.include?("new")
        :new
      elsif split_path.include?("edit")
        :edit
      elsif split_path.size == 2
        :show
      else
        404
      end
    end

  end

end