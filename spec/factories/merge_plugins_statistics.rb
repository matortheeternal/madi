FactoryGirl.define do
  factory :merge_plugins_statistic do
    user_id 1
    times_run 1
    merges_built 1
    plugins_checked 1
    plugins_fixed 1
    plugins_merged 1
    reports_submitted 1
  end
end
