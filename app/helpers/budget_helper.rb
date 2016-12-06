module BudgetHelper

  def heading_name(heading)
    heading.present? ? heading.name : t("budget.headings.none")
  end

  def namespaced_budget_investment_path(investment, options={})
    case namespace
    when "management::budgets"
      management_budget_investment_path(investment, options)
    else
      budget_investment_path(investment, options.merge(budget_id: investment.budget_id))
    end
  end

  def display_budget_countdown?(budget)
    budget.balloting?
  end

  def css_for_ballot_heading(heading)
    return '' unless current_ballot.present?
    current_ballot.has_lines_in_heading?(heading) ? 'active' : ''
  end

  def current_ballot
    Budget::Ballot.where(user: current_user, budget: @budget).first
  end
end
