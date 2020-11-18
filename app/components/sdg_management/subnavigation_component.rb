class SDGManagement::SubnavigationComponent < ApplicationComponent
  attr_reader :current

  def initialize(current:)
    @current = current
  end

  private

    def sections
      %i[goals targets]
    end

    def link_to_section(section)
      link_to "SDG::#{section.to_s.classify}".constantize.model_name.human(count: 2).titleize,
              path_for(section),
              class: active_style(section)
    end

    def path_for(section)
      {
        controller: "sdg_management/#{section}",
        action: :index
      }
    end

    def active_style(section)
      "is-active" if section == current
    end
end
