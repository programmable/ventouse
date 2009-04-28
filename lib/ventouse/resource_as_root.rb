# Fix routing to enable this:
#
# map.resources :organizations, :as => :root
#
# to produce this:
#
#          organizations GET /
#       new_organization GET /new
#      edit_organization GET /:id/edit
#           organization GET /:id
#
module ResourceAsRoot
  module ResourcesHacks
    def map_resource_routes map, resource, action, route_path, *args
      route_path.gsub!(/\/\//, '/')
      super
    end

    def map_resource entities, options = {}, *args
      options[:as] = '' if options[:as] == :root
      super
    end
  end
end

ActionController::Resources.send :include, ResourceAsRoot::ResourcesHacks
ActionController::Routing::RouteSet::Mapper.send :include, ResourceAsRoot::ResourcesHacks # Just cause it's too late
